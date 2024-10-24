# ZSH

**Attention** d'avoir oh-my-zsh d'installer. Les fichiers sont à placer dans le dossier

```shell
~/.oh-my-zsh/custom
```

alias.zsh ne nécessite aucune installation au préalable. Par contre tous les autres sont à installer (de préférence avec brew).

---
**Si** utilisation de NVM, il est conseillé d'ajouter dans le fichier **.zshrc**:
```shell
zstyle ':omz:plugins:nvm' lazy yes
```
et dans les plugins ajouter **nvm**
```shell
plugins=(git zsh-autosuggestions zsh-syntax-highlighting nvm)
```
---
<br/>
<br/>
<br/>
Au niveau de .zshrc:

```shell
source .zshrc
```
