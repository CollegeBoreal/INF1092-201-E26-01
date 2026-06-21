Installation de Windows Server 2022 Datacenter
1.	Vérifications
Vérifier que le matériel fonctionne correctement.
•	CPU installé
•	RAM installée
•	 Disques détectés
•	Clavier et écran connectés
Puis :
	Vérifier  l’Alimentation
	Vérifier la connexion réseau (Câble réseau branché)

2.	Installation de Windows Server
	Démarrer le serveur. 
	Choisir PXE Boot ou la clé USB. 
	Sélectionner Windows Server 2022 Datacenter .
	Choisir le disque d'installation. 
	Supprimer les anciennes partitions si nécessaire. 
	Cliquer sur Installer. 
	Attendre la fin de l'installation. 

3.	Première connexion
Étapes
•	Se connecter avec Administrator (pxe@labinfo.local).
•	Créer un mot de passe sécurisé (Boreal@2026)

4.	Résumer de mon travail :
Pendant ce laboratoire, j’ai installé Microsoft Windows Server avec Windows Deployment Services (WDS). J’ai d’abord démarré l’ordinateur à partir du réseau avec le démarrage PXE. Ensuite, j’ai choisi la langue et le clavier, puis je me suis connecté au serveur.
Après cela, j’ai sélectionné le disque de destination et lancé l’installation de Windows Server. Les fichiers ont été copiés automatiquement.
À la fin de l’installation, j’ai accepté la licence et créé le compte Administrateur avec un mot de passe sécurisé. Le serveur était ensuite prêt à être utilisé.





