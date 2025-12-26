#! /bin/bash

echo "---------------------------"
read -p "Config folder (space separated): " -a destiny
my_array=("${destiny[@]}")

read -p "Root config folder (.config | .local | etc): " root_config

for pkg in "${my_array[@]}"; do
  path="$root_config/$pkg"
  inverse_path="$pkg/$root_config"

  echo "Creating folder: $inverse_path"
  mkdir -p "$inverse_path"
  if [[ -n "$root_config" ]]; then
    if [ ! -d "$HOME/$path" ]; then
      echo "❌ Error: $HOME/$path does not exist"
      exit 1
    fi
  fi

  echo "Moving $HOME/$path → $inverse_path"
  mv "$HOME/$path" "$inverse_path"

  echo "✅ Done. Now run: stow $pkg"

  #Run Stow
  stow -t ~ "$pkg"
done
