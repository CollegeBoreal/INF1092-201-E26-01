provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure

  # Réduit les collisions quand plusieurs étudiants créent des VM en même temps.
  random_vm_ids = true
}