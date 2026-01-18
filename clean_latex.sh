#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: $(basename "$0") [directory]"
  echo "Removes LaTeX byproducts in the target directory (default: current)."
  exit 0
fi

target="${1:-.}"
if [[ ! -d "$target" ]]; then
  echo "Error: directory not found: $target" >&2
  exit 1
fi

shopt -s nullglob
patterns=(
  "*.aux"
  "*.log"
  "*.out"
  "*.toc"
  "*.bbl"
  "*.blg"
  "*.synctex.gz"
  "missfont.log"
)

for pattern in "${patterns[@]}"; do
  rm -f "$target"/$pattern
done
