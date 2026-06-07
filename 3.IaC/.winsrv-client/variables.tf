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