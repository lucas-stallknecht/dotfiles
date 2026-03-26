export GIT_EDITOR="nvim --wait"

source ~/.zsh/git-prompt.zsh/git-prompt.zsh

PROMPT='%F{white} %n%f %1~ '
RPROMPT='%F{cyan}$(
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
  printf "(%s)" "$(git branch --show-current 2>/dev/null)"
)%f'


autoload -Uz compinit
compinit

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh

# Tmux stuff
SESH="sesh"

tmux set-option -g status on
tmux set-option -g status-style 'bg=brightblack fg=black'
tmux set-option -g window-status-current-style 'fg=white bg=black'
tmux set-option -g window-status-current-format ' #I #W #F '
tmux set-option -g window-status-format ' #I #W #F '

if ! tmux has-session -t $SESH 2>/dev/null; then
    tmux new-session -d -s $SESH -n "editor"

    tmux send-keys -t $SESH:editor "cd ~" C-m
    tmux send-keys -t $SESH:editor "vim ." C-m

    tmux new-window -t $SESH -n "misc"
fi

tmux attach-session -t $SESH
