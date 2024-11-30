#!/usr/bin/env bash

file_path_remote="/vagrant-data/all/join-cluster.sh"
until [ -f "$file_path_remote" ]
do
  echo "Waiting for the file to be created..."
  sleep 10
done
echo "The file exists. Proceeding..."

bash $file_path_remote
