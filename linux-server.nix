{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  programs.git = {
    enable = true;
    userName  = "suive";
    userEmail = "e@suive.name";
  };

  programs.zsh = {
    shellAliases = {
      ls = "ls -hlNa --color=auto";
      ns = "sudo nixos-rebuild switch";
    };
  };

  programs.go = {
    enable = true;
    goPath = ".go";
  };
}
