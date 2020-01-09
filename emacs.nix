{
  programs.emacs = {
    enable = true;
  };

  home.file = {
    ".config/emacs/config.org".source = ./emacs/config.org;
    ".emacs.d/init.el".source = ./emacs/init.el;
  };
}
