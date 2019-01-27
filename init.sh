#!/bin/bash

# TODO: read-def

user_name=$(git config --global user.name)
echo -n "git config --global user.name: (default = $user_name) "
read user_name 

user_email=$(git config --global user.email)
echo -n "git config --global user.email: (default = $user_email) "
read user_email

# use sudo because of --system flag
[ -n "$user_name" ] && sudo git config --global user.name "$user_name"
[ -n "$user_email" ] && sudo git config --global user.email "$user_email"

if [ -f ".bashrc" ]
then
    source ./.bashrc
    echo >>~/.bashrc # append newline
    cat <.bashrc >>~/.bashrc
fi

# update apt-get packages
sudo apt-get update

# install missing package: dos2unix
sudo apt-get install dos2unix

# install go
mkdir "$GOPATH" "$GOBIN" "$GOCACHE" "$GOPATH/src" "$GOPATH/pkg" >/dev/null 2>&1

git clone "https://github.com/udhos/update-golang" update-golang
sudo ./update-golang/update-golang.sh
sudo rm -f /usr/local/go*.tar.gz >/dev/null 2>&1
    
if [ -f ".profile" ]
then
    source .profile
    echo >>~/.bashrc # append newline
    cat <.profile >>~/.profile
fi