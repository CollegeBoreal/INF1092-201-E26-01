# 🛑 GIT

## Pourquoi Git est devenu incontournable 🧠

Pas “par dogme”, mais parce que **Git te fait gagner du temps, de la crédibilité et de la sérénité** en tant qu’informaticien.


### 1. Tu travailles rarement seul

Même si tu es :

* admin système 💻
* dev 🧑‍💻
* DevOps ⚙️
* enseignant / formateur 🎓

👉 Dès que **plus d’une personne touche aux mêmes fichiers**, Git évite le chaos :

* “c’est qui qui a cassé ça ?”
* “j’avais une version qui marchait hier…”
* “ne touche pas à ce fichier !!!”

Git garde **l’historique, les auteurs, les changements**.

---

### 2. Git n’est PAS réservé aux développeurs

En vrai, Git sert aussi pour :

* scripts Bash / PowerShell
* fichiers Terraform / OpenTofu
* Ansible / Docker / Kubernetes
* configurations Linux (`nginx`, `systemd`, `proxmox`, etc.)
* notes techniques / cours / TP

👉 **L’infra moderne est versionnée.**

---

### 3. C’est un standard du marché 💼

Dans une offre d’emploi informatique :

* “Git” est souvent **implicitement requis**
* ne pas le connaître = **signal rouge** 🚨
* le connaître = “ok, il est pro”

Même une connaissance **basique** suffit déjà à faire la différence.

---

## Ce que tu dois connaître (pas plus) 🧩

Tu n’as **pas besoin d’être un gourou Git**.

Le strict minimum utile :

```bash
git clone
git status
git add
git commit
git pull
git push
```

Et comprendre :

* dépôt (repo)
* commit
* branche (au moins `main`)
* historique

👉 80 % des usages réels.

---

## Quand Git devient *vraiment* indispensable 🚀

* travail en équipe
* projets long terme
* automatisation / infra as code
* enseignement (corriger, suivre, comparer)
* portfolio pro (GitHub / GitLab)

---

## En résumé 🧠

❌ Git n’est pas “optionnel”
❌ Git n’est pas réservé aux devs
✅ Git est un **outil de survie professionnelle**

---

Parfait 😄
Voici **la leçon Git ultra-condensée pour informaticien** — **pragmatique, sans blabla**, orientée terrain.

---

# 🧠 Git — l’essentiel pour informaticien

## 1. À quoi sert Git (en 1 phrase)

👉 **Git sauvegarde, versionne et trace les changements de fichiers**, localement et à plusieurs.

---

## 2. Concepts minimum à connaître

| Terme        | À retenir                            |
| ------------ | ------------------------------------ |
| dépôt (repo) | dossier suivi par Git                |
| commit       | photo des fichiers à un moment donné |
| historique   | suite des commits                    |
| branche      | ligne de versions                    |
| `main`       | branche principale                   |

🧩 Git ≠ GitHub
Git = outil local
GitHub / GitLab = serveurs distants

---

## 3. Cycle de travail standard (90 % des cas)

```bash
git status        # voir l’état
git add .         # préparer les fichiers
git commit -m "message clair"
git pull          # récupérer changements distants
git push          # envoyer ses changements
```

➡️ **Toujours `pull` avant de `push`**

---

## 4. Démarrer un projet

### Nouveau dossier

```bash
git init
git add .
git commit -m "Initial commit"
```

### Projet existant

```bash
git clone https://...
```

---

## 5. Bonnes pratiques simples (mais pro)

### Messages de commit

❌ `update`
❌ `fix`

✅ `Fix nginx config syntax error`
✅ `Add hourly log analysis script`

---

### Ne JAMAIS versionner 🚨

Utilise `.gitignore` pour :

* mots de passe
* clés SSH
* fichiers temporaires
* logs

Exemple :

```gitignore
*.log
*.tmp
.env
id_rsa
```

---

## 6. Corriger une erreur (sans paniquer)

### Annuler un fichier modifié

```bash
git checkout -- fichier
```

### Voir l’historique

```bash
git log --oneline
```

### Revenir à un état précédent

```bash
git reset --hard <commit_id>
```

⚠️ destructif → uniquement si sûr

---

## 7. Travailler à plusieurs (essentiel)

```bash
git pull
# résoudre conflits si besoin
git add .
git commit
git push
```

Conflit = Git te demande **de choisir**, pas une erreur.

---

## 8. Git pour informaticien (cas concrets)

Git est parfait pour :

* scripts Bash / Python
* configs Nginx / Apache
* Docker / Compose
* Terraform / OpenTofu
* Ansible
* Proxmox (docs + scripts)

👉 **Infrastructure as Code = Git obligatoire**

---

## 9. Erreurs classiques (et normales)

* oublier `git pull`
* commiter trop de fichiers
* message de commit vague
* paniquer face à un conflit

➡️ Tout le monde passe par là. Les pros aussi 😄

---

## 10. Check-list “je suis opérationnel” ✅

- ✔ cloner un repo
- ✔ modifier un fichier
- ✔ commit clair
- ✔ push sans casser
- ✔ comprendre l’historique

Si oui → **tu sais utiliser Git**

---

## 🧠 En une phrase finale

> Git n’est pas compliqué, **il est strict**.
> Une fois le réflexe pris, tu ne travailles plus jamais sans.
