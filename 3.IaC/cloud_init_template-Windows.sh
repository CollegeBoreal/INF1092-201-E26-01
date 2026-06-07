# ---------- CREATE VM ----------
qm create 9001 \
  --name win2022-template \
  --memory 4096 \
  --cores 1 \
  --net0 virtio,bridge=vmbr0

# ---------- DISK (SATA ✅ PAS SCSI) ----------
qm set 9001 --sata0 local-lvm:40

# ---------- ISO WINDOWS ----------
qm set 9001 --sata2 local:iso/en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso,media=cdrom

# ---------- BOOT ----------
qm set 9001 --boot order=sata2

# ---------- CPU FIX ----------
qm set 9001 --cpu qemu64
qm set 9001 --machine pc

# ---------- DISABLE KVM (IMPORTANT) ----------
qm set 9001 --kvm 0

# ---------- UEFI ----------
qm set 9001 --bios ovmf
qm set 9001 --efidisk0 local-lvm:1,format=raw

# ---------- START ----------
# qm start 9001
