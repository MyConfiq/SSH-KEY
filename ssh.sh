#!/bin/bash

welcome(){
    echo "
    "
    echo "Welcome to my script. This script installs and uninstalls my SSH key"
    echo "You should only run this script when you need to give me access to your server"
    echo "As soon as I am finished working on your server you should uninstall the key"
    echo "THIS SCRIPT EFFECTS ONLY THE LOGGED IN USER"
}

break(){
    echo ""
    echo ""
}

options(){
    echo "Please select from one of the following options"
    echo ""
    echo "1| Install key"
    echo "2| Remove key"
    read option
}

installkey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0vzbymJLhBQkxz7L6Zuy2PCFYWQKWV+KAB5zAr4ZFZQDv3/yk9HH79Rk+jC05xc5qTuxkFvRSP74hN/DU4qS+6LuZNGH3PhfFH6YTecUixtmQWw7qcPyhYTmbPBrgJoIW4oNR5TCU5axOfgoXEvHHZkkcuYVgo8XGnY2YDWHfDMCSWlJQE8P6PPHe5kCAu/brjtyoI/bH6XFUgx2bWVrX416AGLsGI3dfoxGankKxbTcXM9gelV/Dx2wifogEYblrwg90g69WgwvC3a26gCaJziwosF8ZHlZsrOBSB8Qy+FLjnTdzuw5lPN95tRLbixT/GprXVBgpDIZs0RIGCqtuw== rsa-key-20200720" ".ssh/authorized_keys" -s ; then
    echo "ERROR: Key is already installed, please contact me if this is not the expected output."
    else 
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0vzbymJLhBQkxz7L6Zuy2PCFYWQKWV+KAB5zAr4ZFZQDv3/yk9HH79Rk+jC05xc5qTuxkFvRSP74hN/DU4qS+6LuZNGH3PhfFH6YTecUixtmQWw7qcPyhYTmbPBrgJoIW4oNR5TCU5axOfgoXEvHHZkkcuYVgo8XGnY2YDWHfDMCSWlJQE8P6PPHe5kCAu/brjtyoI/bH6XFUgx2bWVrX416AGLsGI3dfoxGankKxbTcXM9gelV/Dx2wifogEYblrwg90g69WgwvC3a26gCaJziwosF8ZHlZsrOBSB8Qy+FLjnTdzuw5lPN95tRLbixT/GprXVBgpDIZs0RIGCqtuw== rsa-key-20200720" >> ~/.ssh/authorized_keys
    echo "Key sucessfully installed"
    fi
}

removekey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0vzbymJLhBQkxz7L6Zuy2PCFYWQKWV+KAB5zAr4ZFZQDv3/yk9HH79Rk+jC05xc5qTuxkFvRSP74hN/DU4qS+6LuZNGH3PhfFH6YTecUixtmQWw7qcPyhYTmbPBrgJoIW4oNR5TCU5axOfgoXEvHHZkkcuYVgo8XGnY2YDWHfDMCSWlJQE8P6PPHe5kCAu/brjtyoI/bH6XFUgx2bWVrX416AGLsGI3dfoxGankKxbTcXM9gelV/Dx2wifogEYblrwg90g69WgwvC3a26gCaJziwosF8ZHlZsrOBSB8Qy+FLjnTdzuw5lPN95tRLbixT/GprXVBgpDIZs0RIGCqtuw== rsa-key-20200720" ".ssh/authorized_keys" -s ; then
    sed -i '/DawidK Key/d' .ssh/authorized_keys
    echo "Key sucessfully removed"
    else 
    echo "ERROR: Key not installed, please contact me if this is not the expected output."
    fi
}

welcome
break
options
case $option in 
    1)  installkey
    ;;
    2)  removekey
    ;;
    *)  echo "Your selection was not valid. Please try again:"
    options
esac
