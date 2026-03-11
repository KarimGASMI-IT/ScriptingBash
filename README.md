# Outil d’Administration Système en Bash

## Présentation

Ce projet a été réalisé dans le cadre de mon **Bachelor en Administration Systèmes, Réseaux et Sécurité**, lors d’un module consacré au **scripting Bash et à l’automatisation des tâches d’administration système**.

L’objectif de ce projet était de développer un **script Bash interactif** permettant d’automatiser plusieurs opérations courantes d’administration sous Linux.

Le script propose un **menu interactif** permettant à l’utilisateur de choisir différentes actions liées à :

* la gestion des utilisateurs
* la sauvegarde de données
* l’installation d’un serveur web
* la maintenance du système

Ce projet a été réalisé dans un **environnement Linux (machine virtuelle)**.

---

## Objectifs du projet

L’objectif principal était d’apprendre à :

* automatiser des tâches d’administration système
* manipuler les commandes Linux via un script Bash
* structurer un script avec plusieurs fonctions
* créer une interface simple via un **menu interactif**

---

## Fonctionnalités

### 1️⃣ Vérification des utilisateurs connectés

Le script permet de :

* vérifier si un utilisateur est actuellement connecté à la machine
* afficher les connexions correspondantes
* proposer de **terminer les processus de cet utilisateur**

Commandes utilisées :

```bash
who
pkill -u
```

---

### 2️⃣ Vérification d’un utilisateur dans le système

Le script permet de vérifier si un utilisateur est présent dans :

```bash
/etc/passwd
```

Si l’utilisateur existe, le script affiche également **son groupe principal**.

Commande utilisée :

```bash
getent passwd
```

---

### 3️⃣ Sauvegarde d’un répertoire

Le script permet de :

* vérifier l’existence d’un répertoire
* créer un dossier de sauvegarde
* copier le répertoire dans `/home/save`

Commande utilisée :

```bash
cp -r
```

---

### 4️⃣ Installation d’un serveur LAMP

Le script peut installer automatiquement une **stack LAMP** :

* Linux
* Apache
* MySQL
* PHP

Packages installés :

```bash
apache2
mysql-server
php
libapache2-mod-php
php-mysql
```

Après l’installation, le script :

* démarre les services Apache et MySQL
* vérifie leur état avec `systemctl`

Il propose également de **sauvegarder une base de données MySQL** via :

```bash
mysqldump
```

---

### 5️⃣ Mise à jour du système

Le script permet d’automatiser la mise à jour du système :

```bash
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
```

Cela permet de :

* installer les mises à jour
* nettoyer les paquets inutiles

---

## Menu interactif

Le script propose un **menu principal** permettant de choisir l’action à exécuter.

Exemple :

```text
Menu principal

1 - Vérifier si un utilisateur est connecté
2 - Vérifier un utilisateur dans /etc/passwd
3 - Sauvegarder un répertoire
4 - Installer un serveur LAMP
5 - Mettre à jour le système
```

L’utilisateur sélectionne simplement une option pour exécuter la fonction correspondante.

---

## Technologies utilisées

* **Bash**
* **Linux (Debian / Ubuntu)**
* **Apache2**
* **MySQL**
* **PHP**
* **commandes système Linux**

---

## Structure du script

Le script est organisé en plusieurs fonctions :

```
check_user_connected
check_user_in_passwd
backup_directory
install_lamp
update_system
```

Chaque fonction correspond à **une tâche d’administration spécifique**.

---

## Exécution du script

Rendre le script exécutable :

```bash
chmod +x script.sh
```

Puis lancer :

```bash
./script.sh
```

---

## Compétences développées

Ce projet m’a permis de travailler sur :

* le **scripting Bash**
* l’**automatisation de tâches système**
* la **gestion des utilisateurs Linux**
* la **sauvegarde de données**
* l’installation automatisée de services
* l’utilisation de **fonctions dans un script**

---

## Améliorations possibles

Plusieurs améliorations pourraient être ajoutées :

* ajout d’une **boucle pour relancer le menu sans quitter le script**
* validation des entrées utilisateur
* gestion avancée des erreurs
* ajout de logs
* amélioration de l’interface utilisateur

---

## Auteur
Karim GASMI
Étudiant en Informatique
Ce projet à été réalisé dans le cadre de mon Bachelor **Administration Systèmes, Réseaux et Sécurité**

Formation initiale : **Bachelor Administration Systèmes, Réseaux et Sécurité**
