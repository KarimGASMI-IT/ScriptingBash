#!/bin/bash

# Fonction 1 : Vérifier si un utilisateur est connecté
function check_user_connected {
    read -p "Entrez le login de l'utilisateur à rechercher : " login
    if who | grep -q "$login"; then
        echo "L'utilisateur $login est connecté."
        echo "Connexions correspondantes :"
        who | grep "$login"
        read -p "Voulez-vous tuer ces tâches ? (o/n) : " choice
        if [ "$choice" == "o" ]; then
            pkill -u "$login"
            echo "Les tâches de l'utilisateur $login ont été tuées."
        fi
    else
        echo "L'utilisateur $login n'est pas connecté."
    fi
}

# Fonction 2 : Vérifier la présence d'un utilisateur dans /etc/passwd
function check_user_in_passwd {
    read -p "Entrez le login de l'utilisateur à rechercher dans /etc/passwd : " login
    if getent passwd "$login" > /dev/null; then
        echo "L'utilisateur $login est présent dans /etc/passwd."
        group=$(getent passwd "$login" | cut -d: -f4)
        echo "L'utilisateur $login est rattaché au groupe : $group"
    else
        echo "L'utilisateur $login n'est pas présent dans /etc/passwd."
    fi
}

# Fonction 3 : Sauvegarde d'un répertoire
function backup_directory {
    read -p "Entrez le nom du répertoire à sauvegarder : " dir
    if [ -d "$dir" ]; then
        mkdir -p /home/save
        cp -r "$dir" /home/save/
        echo "Le répertoire $dir a été sauvegardé dans /home/save."
    else
        echo "Le répertoire $dir n'existe pas."
    fi
}

# Fonction 4 : Installation d'un serveur LAMP
function install_lamp {
    if command -v apache2 > /dev/null; then
        echo "Le serveur LAMP est déjà installé."
        systemctl status apache2
    else
        echo "Installation du serveur LAMP..."
        sudo apt update
        sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql -y
        echo "Le serveur LAMP a été installé."
        systemctl start apache2
        systemctl start mysql
        echo "Vérification du fonctionnement du serveur LAMP..."
        systemctl status apache2
        systemctl status mysql
    fi

    # Sauvegarde d'une base de données MySQL
    read -p "Entrez le nom de la base de données à sauvegarder : " dbname
    read -p "Entrez le nom du fichier de sauvegarde : " backupfile
    mysqldump -u root -p "$dbname" > "$backupfile"
    echo "La base de données $dbname a été sauvegardée dans $backupfile."
}

# Fonction 5 : Mise à jour du système d'exploitation
function update_system {
    echo "Mise à jour du système d'exploitation..."
    sudo apt update && sudo apt upgrade -y
    echo "Nettoyage après mise à jour..."
    sudo apt autoremove -y
    echo "Mise à jour et nettoyage terminé."
}



# Menu principal
echo "----------------------------------- Menu Principal -----------------------------------"
echo "Choisissez une option :"
echo " - 1. Rechercher si un utilisateur est connecté sur la machine -"
echo " - 2. Rechercher la présence d'un utilisateur dans le fichier /etc/passwd -"
echo " - 3. Sauvegarde d'un répertoire -"
echo " - 4. Installation d'un serveur LAMP -"
echo " - 5. Mise à jour du système d'exploitation -"
read -p "Votre choix : " choice

case $choice in
    1) check_user_connected ;;
    2) check_user_in_passwd ;;
    3) backup_directory ;;
    4) install_lamp ;;
    5) update_system ;;
    *) echo "Choix invalide." ;;
esac
