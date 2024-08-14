#!/bin/bash
##############? INFO ###############
# Marche bien avec 2 apps à l'écran.
# À première vu le ratio est doit être positionné en fonction de l'axe X.
# Si l'on rajoute pas les conditions dans les IF les ratios sont en parties inverées.
# Dans le résultat de 'split-child' il n'y a que first_child et second_child. Les autres ne sont pas indiqués.
# PISTE:
# On pourrait essayé avec les espaces et les id de l'application et jouer sur les GRIDs:
# ex: yabai -m window --grid 4:4:1:1:2:2
# Décommenter les lignes suivantes pour avoir des logs.
# log_file=/tmp/yabai_debug_perso.log
# echo "SPACE : $(yabai -m query --spaces --space)" >> $log_file
# echo "app $app" >> $log_file
###########? FIN INFO ##############

# Récupérer les infos de l'application en cours
app=$(yabai -m query --windows --window)

# Largeur de l'app
app_width=$(echo "$app" | jq -r '.frame.w')

# split-child
app_child=$(echo "$app" | jq -r '.["split-child"]')

# Déterminer si l'app est first_child
isFirstChild=false
if [ "$app_child" == "first_child" ]; then
    isFirstChild=true
fi

# Tous les écrans
displays=$(yabai -m query --displays)

# Extraire la largeur de l'écran qui a le focus
focused_display_width=$(echo "$displays" | jq -r '.[] | select(.["has-focus"] == true) | .frame.w')

# Calculer le ratio
current_ratio=$(echo "scale=4; $app_width / $focused_display_width" | bc)

# Si en mode fullscreen -> quitte et passe en ratio à 0.5
# Sinon, change le ratio
# Vérifier si la fenêtre est en mode fullscreen
if [ "$(echo "$app" | jq -r '.["has-fullscreen-zoom"]')" == "true" ]; then
    yabai -m window --toggle zoom-fullscreen
    yabai -m window --ratio abs:0.5
elif (( $(echo "$current_ratio <= 0.3" | bc -l) )); then
    yabai -m window --ratio abs:0.5
elif (( $(echo "$current_ratio <= 0.6" | bc -l) )); then
    if [ "$isFirstChild" == "true" ]; then
        yabai -m window --ratio abs:0.75
    else
        yabai -m window --ratio abs:0.25
    fi
    echo "current_ratio <= 0.6" >> $log_file
else
    if [ "$isFirstChild" == "true" ]; then
        yabai -m window --ratio abs:0.25
    else
        yabai -m window --ratio abs:0.75
    fi
fi
