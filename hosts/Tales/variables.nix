{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Tales-Cunha";
  gitEmail = "tvac@cin.ufpe.br";

  # Hyprland Settings
  extraMonitorSettings = "";

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "brave"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";

  username = "talesc";
  dotfilesDir = "/home/talesc/.dotfiles"; # Absolute path of the local repo
  theme = "nord"; # Selected theme from themes directory (./themes/)
  #themeDetails = import (./. + "home-manager/themes/nord.nix") {dir = dotfilesDir;};
}
