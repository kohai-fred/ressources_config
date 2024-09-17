#!/bin/bash
# Récupérer les infos de l'application en cours
app=$(yabai -m query --windows --window)

# Largeur de l'app
# app_width=$(echo "$app" | jq -r '.frame.w')

# split-child
app_child=$(echo "$app" | jq -r '.["split-child"]')

# Définie la taille
size=${1:-250}

# Déterminer si l'app est first_child
isFirstChild=false
if [ "$app_child" == "first_child" ]; then
    isFirstChild=true
fi
log_file=/tmp/yabai_debug_perso.log


if [ "$isFirstChild" == "true" ]; then
    yabai -m window --resize right:-$size:0
else
    yabai -m window --resize left:$size:0
fi