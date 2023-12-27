#!/bin/bash

# Password database file
password_file="passwords.txt"

# Check if the database file exists; if not, create one
if [ ! -e "$password_file" ]; then
    touch "$password_file"
fi


# Function to retrieve a password
get_password() {
    read -p "Enter the account name: " account
    password=$(grep "^$account:" "$password_file" | cut -d " " -f 2)  #Retrieve second field from it d=delim
  
    if [ -n "$password" ]; then
        echo "Password for $account: $password"
    else
        echo "Password not found for $account."
    fi
}


# Function to add a new password
add_password() {
    read -p "Enter the account name: " account
    read -p "Enter the password: " password
    echo "$account: $password" >> "$password_file"		#storing password and account in one file
    echo "Password added for $account."
}



# Menu for password management
while true; do
    echo 
    echo
    echo "Password Manager Menu:"
    echo "1. Add a new password"
    echo "2. Retrieve a password"
    echo "3. Quit"
    echo
    read -p "Choose an option (1/2/3): " choice
    echo
    case $choice in
        1) add_password;;
        2) get_password;;
        3) exit;;
        *) echo "Invalid option";;
    esac
done