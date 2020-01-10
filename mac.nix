{ pkgs, ... }:

{
  imports = [ ./common.nix ./emacs.nix ];

  programs.zsh = {
    shellAliases = {
      ls = "ls -hlGa";
    };
  };
}
