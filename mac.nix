{ pkgs, ... }:

{
  imports = [ ./common.nix ./emacs.nix ];

  programs.zsh = {
    shellAliases = {
      ls = "ls -hlGa";
    };
  };

  home.file = {
    ".hushlogin".source = builtins.toFile "hushlogin" "";
  };

}
