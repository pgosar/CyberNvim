#!/usr/bin/env bash

if [ -d "$@" ]; then
  echo "Files found: $(find "$@" -type f | wc -l)"
  echo "Folders found: $(find "$@" -type d | wc -l)"
else
  echo "[ERROR] Please retry with another folder."
  exit 1
fi
