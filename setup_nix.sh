#!/bin/bash

# Função para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Instalando Nix apenas se não estiver instalado
if command_exists nix; then
    echo "Nix já está instalado, pulando instalação."
else
    echo "Instalando Nix..."
    sh <(curl -L https://nixos.org/nix/install)
fi

# Criando diretório de configuração do Nix e adicionando configurações
mkdir -p ~/.config/nix
cat <<EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

# Reiniciando o serviço do daemon do Nix (macOS)
sudo launchctl kickstart -k system/org.nixos.nix-daemon

# Clonando o repositório de dotfiles se ainda não estiver clonado
if [ -d "~/.config/nixpkgs" ]; then
    echo "Repositório já clonado, pulando clonagem."
else
    echo "Clonando repositório de dotfiles..."
    git clone https://github.com/Arkham/dotfiles.nix.git ~/.config/nixpkgs
fi

# Aplicando a configuração do Home Manager com o flake existente
cd ~/.config/nixpkgs
home-manager switch --flake .
