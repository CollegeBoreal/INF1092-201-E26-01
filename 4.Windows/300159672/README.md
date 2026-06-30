**Installation de Windows Server 2022 Datacenter**
1. **Vérifications**
2. J'ai Vérifié que le matériel fonctionne correctement.

CPU installé
RAM installée
Carte RAID présente
Disques détectés
Clavier et écran connectés

Puis :
Vérifier l'alimentation (PSU1 et PSU2)
Vérifier la connexion réseau (câble réseau branché, ports fonctionnels)


2. **Installation de Windows Server**
Démarrer le serveur.
Choisir le démarrage PXE (F12).
Se connecter au serveur PXE (pxe@labinfo.local).
Sélectionner Windows Server 2022 Datacenter (Desktop Experience).
Choisir le disque d'installation.
Supprimer les anciennes partitions si nécessaire.
Cliquer sur Installer.
Attendre la fin de l'installation (environ 15 minutes).


4. **Première connexion**

   
Étapes :

Se connecter avec Administrator **(pxe@labinfo.local)**.
Créer un mot de passe sécurisé **(Boreal@2026).**

4.**Résumé de mon travail**

Pendant ce laboratoire, j'ai installé Windows Server 2022 Datacenter sur un serveur HP DL360 G6 en utilisant la méthode de démarrage PXE. J'ai d'abord vérifié le matériel du serveur (CPU, RAM, disques, alimentation, réseau) pour m'assurer qu'il était prêt. Ensuite, j'ai démarré le serveur via le réseau avec PXE Boot, choisi la langue française, puis je me suis connecté au serveur PXE du laboratoire. J'ai sélectionné le disque de destination, supprimé les anciennes partitions, puis lancé l'installation de Windows Server 2022 Datacenter en mode Desktop Experience. Une fois l'installation terminée, j'ai créé le compte Administrateur avec un mot de passe sécurisé conforme aux exigences de complexité du laboratoire. Le serveur était ensuite prêt pour les configurations post-installation.



