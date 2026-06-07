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