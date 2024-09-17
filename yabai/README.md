## Yabai

Pour trouver l'id (ou info) sur une appli ouverte à l'écran: yabai -m query --windows --space

Pour iTerms2 vérifier l'id. Cela permet de sortir du flux de Yabai le terminal(en haut de l'écran) avec le hotkey et de
laisser les autres fenêtres de iTerms2 fonctionner normalement. yabai -m rule --add app="^iTerm2$" id=1243 manage=off #
iTerm2 hotkey

## SKHD

**Attention** d'avoir les packages brew: **jq** et **bc** pour que les différent scripts fonctionnent. **borders** pour
les bordures activent (nécessite Sonoma ou +)

C'est dans le fichier **skhdrc** où se trouvent les raccourcis pour les apps. Par exemple:

- capsLock - s -> lance ou focus Spotify
