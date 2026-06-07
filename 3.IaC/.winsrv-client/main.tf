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