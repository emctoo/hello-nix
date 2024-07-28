_default:
  just --list

# rust-drv.nix example
rust-drv:
  #!/usr/bin/env bash
  nix build -v -f ./rust-drv.nix
  link_name="result"
  source_dir=$(readlink -f "$link_name")

  # Check if it's actually a symbolic link
  # option `-L` follows all symbolic links and returns the full path of the final destination.
  if [ -L "$link_name" ]; then
      echo "'$link_name' => $source_dir"
  else
      echo "'$link_name' is not a symbolic link."
  fi

# show information of a drv file
drv path:
  nix derivations show {{path}} | jq .

gc-roots path:
  nix-store -q --roots {{path}} | jq .

# show nix store path information
path-info path:
  nix path-info --json {{path}} | jq .

shell-app:
  nix build -v -f ./shell-app.nix
