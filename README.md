# qFioofa-wezterm
Personal wezterm config

# Nix

Ships a `flake.nix` exposing a Home Manager module (`homeManagerModules.default`).
It symlinks `./src` to `~/.config/wezterm` via `xdg.configFile`, so the config can
be managed declaratively instead of running `scripts/deploy.sh`.

```nix
# flake inputs
qFioofa-wezterm.url = "github:qFioofa/qFioofa-wezterm";

# home configuration
imports = [ qFioofa-wezterm.homeManagerModules.default ];
```
