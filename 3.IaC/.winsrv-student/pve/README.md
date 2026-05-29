
```sh
# ---------- CREATE VM ----------
qm create 9001 \
  --name win2022-template \
  --memory 4096 \
  --cores 1 \
  --net0 virtio,bridge=vmbr0

# ---------- DISK ----------
qm set 9001 --scsihw virtio-scsi-pci
qm set 9001 --scsi0 local-lvm:40

# ---------- ISO WINDOWS (SATA ✅) ----------
qm set 9001 --sata2 local:iso/en-us_windows_server_2022_updated_july_2023_x64_dvd_541692c3.iso,media=cdrom

# ---------- ISO VIRTIO ----------
qm set 9001 --sata1 local:iso/virtio-win.iso,media=cdrom

# ---------- BOOT ----------
qm set 9001 --boot order=sata2

# ---------- CPU FIX (G6/G7 ✔) ----------
qm set 9001 --cpu qemu64
qm set 9001 --cores 1
qm set 9001 --machine pc

# ---------- DISABLE KVM (CRITICAL) ----------
qm set 9001 --kvm 0

# ---------- UEFI (REQUIRED for Windows 2022) ----------
qm set 9001 --bios ovmf
qm set 9001 --efidisk0 local-lvm:1,format=raw

# ---------- START ----------
qm start 9001
```

`NY3️⃣HK-GGYWK-XVH2️⃣T-2️⃣VPRX-CDPY7️⃣`
