{ config, pkgs, host,username, ...}:
let
    inherit (import ./home-manager/option.nix) browser terminal dotfilesDir;
in
{
    imports = [
        #(./. + "../../../user/wm"+("/" + ${wm})+".nix")
        # (./. + "../../../user/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
        #./themes/stylix.nix
        #./home-manager/user/apps/kitty.nix
        #./home-manager/user/apps/git.nix
        #./user/apps/superfile.nix
        #./home-manager/user/apps/neofetch
        #./home-manager/user/shell/zsh.nix
        #./home-manager/user/apps/neovim 
    ];

    stylix.targets.hyprland.enable = false;

    home = {
        username = username;
        homeDirectory = "/home/${username}";
    };
    #oi
    # Add packages from the pkgs dir
    #nixpkgs.overlays = import ../../lib/overlays.nix;
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    home.packages = with pkgs; [
        sway-contrib.grimshot
        libreoffice-fresh
        obs-studio
        tty-clock
        qbittorrent
        rtorrent
        cpulimit
        swayimg
        vesktop
        revolt-desktop
        wayvnc
        drawio
        gimp
        mpv

        # Overclock
        dmidecode
        sysbench

        # Sometimes needed for work.
        chromium
        translate-shell

        # These packages are compulsury.
        # settings.editorPkg
        browser
        terminal
        settings.termPkg
    ];

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        music = "${config.home.homeDirectory}/Media/Music";
        videos = "${config.home.homeDirectory}/Media/Videos";
        pictures = "${config.home.homeDirectory}/Media/Pictures";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        templates = null;
        desktop = null;
        publicShare = null;
        extraConfig = {
            XDG_DOTFILES_DIR = "${dotfilesDir}";
            XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
        };
    };

    xdg.dataFile.icons = {
        source = ./non-nix/icons;
        recursive = true;
    };

    home.sessionVariables = {
        #EDITOR = settings.editor;
        TERM = terminal;
        BROWSER = browser;
    };

    # programs.sagemath.enable = true;
    services.kdeconnect.enable = true;
    programs.home-manager.enable = true;

    gtk = {
        enable = true;
        iconTheme = {
            name = "Papirus";
            package = pkgs.papirus-icon-theme;
        };
    };

    home.stateVersion = "23.05";
}
