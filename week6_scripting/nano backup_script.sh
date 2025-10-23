#!/bin/bash

# Ask user for folder path
read -p "Enter the full folder path to back up: " folder

# Check if folder exists
if [ ! -d "$folder" ]; then
  echo "❌ Folder not found!"
  exit 1
fi

# Create backup folder
mkdir -p ~/backup

# Timestamped backup filename
timestamp=$(date +%Y%m%d_%H%M%S)
folder_name=$(basename "$folder")
backup_file="${folder_name}_${timestamp}.tar.gz"

# Create compressed backup
tar -czf ~/backup/"$backup_file" "$folder"

echo "✅ Backup created at: ~/backup/$backup_file"
