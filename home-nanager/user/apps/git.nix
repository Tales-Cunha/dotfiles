{ config, pkgs, ...}:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "Tales-Cunha";
  programs.git.userEmail = "tvac@cin.ufpe.br";
  """programs.git.extraConfig = {
    core.editor = "nvim";
  };
  """
}
