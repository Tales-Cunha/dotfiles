{pkgs, ...}:
rec {
    system = "x86_64-linux";
    hostname = "Tales"; # Hostname
    username = "talesc"; # Ssername
    #profile = "laptop"; # Select from profiles directory
    timezone = "America/Recife"; # Select timezone
    locale = "pt_BR.UTF-8"; # Select locale
    gitname = "Tales-Cunha"; # Name (git config)
    gitemail = "tvac@cin.ufpe.br"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the local repo
    theme = "nord"; # Selected theme from themes directory (./themes/)
    themeDetails = import (./. + "/themes/${theme}.nix") {dir = dotfilesDir;};
    wm = ["gnome"]; # Selected window manager or desktop environment;
                       # must select one in both ./user/wm/ and ./system/wm/
                       # Note, that first WM is incldued included into work profile
                       # second one includes both.

    font = "JetBrains Mono"; # Selected font
    fontPkg = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono"]; });
    fontSize = 12; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;

    # Session variables.
    editor = "nvim"; # Default editor
    editorPkg = pkgs.neovim;
    browser = "firefox"; # Default browser; must select one from ./user/app/browser/
    browserPkg = pkgs.firefox;
    term = "kitty"; # Default terminal command
    termPkg = pkgs.kitty;

    keyboardLayout = "us";
    clock24h = true;

    # Hyprland Settings
    extraMonitorSettings = "";
    
}
