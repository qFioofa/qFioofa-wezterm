{
  description = "qFioofa WezTerm config — Home Manager module";

  # See scripts/deploy.sh: src/ is the config root, target is ~/.config/wezterm.
  outputs = { self }: {
    homeManagerModules.default = { config, lib, pkgs, ... }: {
      xdg.configFile."wezterm" = {
        recursive = true;
        source = ./src;
      };
    };
  };
}
