#!/usr/bin/env bash
# Review before running. Installs an explicitly user-owned local theme.
set -euo pipefail
source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
command -v omarchy >/dev/null
for file in colors.toml shell.toml icons.theme hyprland.lua backgrounds/odyssey.png; do
  test -f "$source_dir/$file" || { echo "Missing release file: $file" >&2; exit 1; }
done
themes_dir="${XDG_CONFIG_HOME:-$HOME/.config}/omarchy/themes"
target_dir="$themes_dir/odyssey-glass"
mkdir -p "$themes_dir"
if [[ -e "$target_dir" || -L "$target_dir" ]]; then
  backup_dir="$target_dir.backup-$(date +%Y%m%d-%H%M%S)-$$"
  mv -- "$target_dir" "$backup_dir"
  printf 'Previous installation saved: %s\n' "$backup_dir"
fi
mkdir -p "$target_dir/backgrounds"
for file in colors.toml shell.toml icons.theme hyprland.lua; do
  cp -- "$source_dir/$file" "$target_dir/$file"
done
cp -- "$source_dir/backgrounds/odyssey.png" "$target_dir/backgrounds/"
omarchy theme set odyssey-glass
printf '\nReturn to your previous theme with: omarchy theme set "THEME NAME"\n'
