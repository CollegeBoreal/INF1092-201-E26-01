
# ✅ Pack OpenTofu “Étudiant” (Windows Server 2022/2025)

## 📁 Arborescence (à donner telle quelle)

    winsrv-student/
    ├─ versions.tf
    ├─ providers.tf
    ├─ variables.tf
    ├─ main.tf
    └─ terraform.tfvars   <-- l’étudiant modifie ce fichier (et ne le pousse pas sur Git)

***

## 1) `versions.tf`

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.106.0"
    }
  }
}
```

 [\[fr.ittrip.xyz\]](https://fr.ittrip.xyz/windows/windows-server/windows-server-etudiant-2024), [\[qa.com\]](https://www.qa.com/course-catalogue/courses/administering-windows-server-qaws25admin/)

***

## 2) `providers.tf`

```hcl
provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure

  # Réduit les collisions quand plusieurs étudiants créent des VM en même temps.
  random_vm_ids = true
}
```

Le provider documente la config endpoint+auth et l’option `random_vm_ids` pour éviter les conflits d’IDs en création concurrente. [\[fr.ittrip.xyz\]](https://fr.ittrip.xyz/windows/windows-server/windows-server-etudiant-2024)

***

## 3) `variables.tf`

```hcl
variable "proxmox_endpoint"  { type = string }
variable "proxmox_api_token" { type = string sensitive = true }
variable "proxmox_insecure"  { type = bool default = true }

# Les 4 noeuds Proxmox (noms des nodes)
variable "nodes" {
  type        = list(string)
  description = "Liste des 4 noeuds Proxmox (ex: [\"pve1\",\"pve2\",\"pve3\",\"pve4\"])"
}

variable "datastore_vm"  { type = string default = "local-lvm" }
variable "datastore_iso" { type = string default = "local" }

variable "winsrv_iso_filename" {
  type        = string
  description = "Nom de l'ISO Windows Server dans <datastore_iso>:iso/"
}

# L'étudiant met son numéro (1..28) → attribution automatique d’un noeud (modulo 4)
variable "student_number" {
  type        = number
  description = "Numéro d'étudiant dans le groupe (1..28). Sert à répartir les VM sur 4 noeuds."
}

variable "vm_name_prefix" { type = string default = "inf1092-winsrv" }

variable "vm_cpu_cores" { type = number default = 2 }
variable "vm_ram_mb"    { type = number default = 4096 }
variable "vm_disk_gb"   { type = number default = 60 }

variable "bridge" { type = string default = "vmbr0" }

# Pour faciliter l’installation Windows sans drivers au début: sata0.
# (Le resource VM supporte scsi/sata/virtio via "interface".) 
variable "system_disk_interface" {
  type    = string
  default = "sata0"
}
```

La doc du resource VM précise bien l’usage du bloc `disk` (dont `interface`) et la présence de `efi_disk`/`tpm_state`. [\[qa.com\]](https://www.qa.com/course-catalogue/courses/administering-windows-server-qaws25admin/)

***

## 4) `main.tf` (création VM Windows Server pour 1 étudiant)

```hcl
locals {
  # Répartit automatiquement les étudiants sur 4 noeuds:
  # 1..7 -> node[0], 8..14 -> node[1], 15..21 -> node[2], 22..28 -> node[3]
  # Variante modulo simple (équilibrée aussi):
  node_index = (var.student_number - 1) % length(var.nodes)
  node_name  = var.nodes[local.node_index]

  vm_name = format("%s-%02d", var.vm_name_prefix, var.student_number)
}

resource "proxmox_virtual_environment_vm" "student_vm" {
  name        = local.vm_name
  description = "VM étudiant (OpenTofu) - Windows Server"
  tags        = ["tofu", "winsrv", "student", format("s%02d", var.student_number)]

  node_name = local.node_name

  # QEMU agent: l’étudiant pourra l’activer après installation des tools dans Windows
  agent { enabled = false }

  cpu { cores = var.vm_cpu_cores }

  memory { dedicated = var.vm_ram_mb }

  # UEFI/OVMF + EFI disk + TPM
  bios = "ovmf"

  efi_disk {
    datastore_id      = var.datastore_vm
    type              = "4m"
    pre_enrolled_keys = true
  }

  tpm_state {
    version      = "v2.0"
    datastore_id = var.datastore_vm
  }

  # Disque système
  disk {
    datastore_id = var.datastore_vm
    interface    = var.system_disk_interface
    size         = var.vm_disk_gb
    cache        = "writeback"
    discard      = "on"
    iothread     = true
  }

  # ISO Windows Server monté en CD-ROM
  # Le resource VM documente file_id pour ISO et la config cdrom. 
  cdrom {
    enabled   = true
    interface = "ide2"
    file_id   = "${var.datastore_iso}:iso/${var.winsrv_iso_filename}"
  }

  network_device { bridge = var.bridge }

  serial_device {}
}
```

Toutes ces sections (`bios`, `efi_disk`, `tpm_state`, `disk`, `cdrom` + `file_id`, `network_device`) sont dans la doc du resource VM. [\[qa.com\]](https://www.qa.com/course-catalogue/courses/administering-windows-server-qaws25admin/)

***

## 5) `terraform.tfvars` (à remplir par **chaque étudiant**)

> ⚠️ À ne pas pousser sur Git (contient un token).

```hcl
# Connexion Proxmox
proxmox_endpoint  = "https://pve.example:8006/"
proxmox_api_token = "terraform@pve!provider=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
proxmox_insecure  = true

# Les 4 noeuds Proxmox (à adapter à vos vrais noms de nodes)
nodes = ["pve1", "pve2", "pve3", "pve4"]

# Stockages
datastore_vm  = "local-lvm"
datastore_iso = "local"

# ISO Windows Server déjà uploadée dans <datastore_iso>:iso/
winsrv_iso_filename = "WinServer2022.iso"
# ou: "WinServer2025.iso"

# IMPORTANT: chaque étudiant met SON numéro 1..28
student_number = 1

# Ressources VM (prof peut imposer des valeurs)
vm_name_prefix = "inf1092-w2k22"
vm_cpu_cores   = 2
vm_ram_mb      = 4096
vm_disk_gb     = 60

bridge = "vmbr0"

# Disque en SATA pour simplifier l'installation
system_disk_interface = "sata0"
```

***

# ▶️ Commandes étudiant (3 lignes)

Dans le dossier `winsrv-student/` :

```bash
tofu init
tofu plan
tofu apply
```

***

# ✅ Variante “plus performance” (si tu veux forcer VirtIO/SCSI)

Tu peux imposer:

```hcl
system_disk_interface = "scsi0"
```

…mais dans ce cas, pendant l’installation Windows, l’étudiant devra souvent **charger des drivers** pour voir le disque (selon le contrôleur/driver inclus). La doc Proxmox insiste justement sur l’installation des pilotes VirtIO pendant l’installation pour de meilleures perf. [\[youtube.com\]](https://www.youtube.com/watch?v=Qnv85FSP5E8)

***

# 📚 References

Parfait — si **chaque étudiant exécute OpenTofu** pour créer **sa propre VM Windows Server**, le plus pratique est de leur donner un **“pack étudiant” identique** où ils n’ont qu’à changer **2–3 variables** (ex. `student_number`, `winsrv_iso_filename`, éventuellement `bridge`).  
Le provider **bpg/proxmox** (OpenTofu/Terraform) + le resource **`proxmox_virtual_environment_vm`** couvrent exactement ce qu’on veut (VM + UEFI/OVMF + EFI disk + TPM + disque + CDROM ISO). [\[fr.ittrip.xyz\]](https://fr.ittrip.xyz/windows/windows-server/windows-server-etudiant-2024), [\[qa.com\]](https://www.qa.com/course-catalogue/courses/administering-windows-server-qaws25admin/)

Ci‑dessous, je te redonne les **scripts tofu complets “par étudiant”** (ils copient le dossier, changent leur numéro, puis `tofu apply`).  
✅ Bonus : on active `random_vm_ids = true` côté provider pour **réduire les collisions** de VMID quand plusieurs étudiants créent des VM en parallèle. [\[fr.ittrip.xyz\]](https://fr.ittrip.xyz/windows/windows-server/windows-server-etudiant-2024)

***


