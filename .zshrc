# Via the AUR
source /usr/share/zsh/scripts/git-prompt.zsh

PROMPT='%F{cyan} %n%f %1~ '
RPROMPT='%F{cyan}$(
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
  printf "(%s)" "$(git branch --show-current 2>/dev/null)"
)%f'


autoload -Uz compinit
compinit

# After installing zsh-syntax-highlighting using pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
