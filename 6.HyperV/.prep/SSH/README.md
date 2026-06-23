

***

# ✅ ✅ MÉTHODE 2 — SCP (si tu fais du DevOps / automatisation)

## 🔧 Étape 1 — Activer SSH sur Windows Server 

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```
```
Path          :
Online        : True
RestartNeeded : False
```


```powershell
Start-Service sshd
```
```
WARNING: Waiting for service 'OpenSSH SSH Server (sshd)' to start...
WARNING: Waiting for service 'OpenSSH SSH Server (sshd)' to start...
WARNING: Waiting for service 'OpenSSH SSH Server (sshd)' to start...
WARNING: Waiting for service 'OpenSSH SSH Server (sshd)' to start...
```

```powershell
Set-Service -Name sshd -StartupType Automatic
```

✔ Windows Server supporte SSH + SCP nativement [\[computingf...rgeeks.com\]](https://computingforgeeks.com/configure-openssh-server-on-windows-server/)

***

## 🔧 Étape 2 — Depuis le Mac (Terminal)

```bash
scp ~/Downloads/WindowsServer2022.iso Administrator@10.7.236.131:D:/ISO/(ton ID)
```

👉 format :

```
scp SOURCE user@IP:DESTINATION
```

✔ SCP permet de copier un fichier vers un serveur distant via SSH [\[bing.com\]](https://bing.com/search?q=scp+mac+to+windows+server+how+to+transfer+file+windows+open+ssh+server+windows+server+2022+scp)

