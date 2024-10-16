#!/bin/bash

# Instalando Nix
sh <(curl -L https://nixos.org/nix/install)

# Criando diret�rio de configura��o do Nix e adicionando configura��es
mkdir -p ~/.config/nix
cat <<EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

# Reiniciando o servi�o do daemon do Nix 
sudo systemctl restart nix-daemon

# Clonando o reposit�rio de dotfiles e executando o home-manager
mkdir -p ~/.config && cd ~/.config
git clone https://github.com/Tales-Cunha/dotfiles.git nixpkgs && cd nixpkgs

# Executando o projeto e aplicando a configura��o do home-manager
nix run . && home-manager switch -b backup
