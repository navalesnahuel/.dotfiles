# =============================
# Paths
# =============================
[ -d "/opt/nvim-linux64/bin" ] && export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH="$PATH:/usr/local/zig"

if [ -d "/usr/local/go" ]; then
    export GOROOT="/usr/local/go"
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH"
fi

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH="$JAVA_HOME/bin:$PATH"

# =============================
# Environment Variables
# =============================

# =============================
# Prompt Configuration
# =============================
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
# PROMPT='%F{magenta}%m%f %F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f$ '
PROMPT='%F{magenta}nahuel%f %F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f$ '

# =============================
# Oh My Zsh
# =============================
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
fi

# =============================
# Aliases
# =============================
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias windows='sudo grub-reboot "Windows" && sudo reboot'
unalias ls 2>/dev/null
alias ls='lsd'
alias l='ls -l'
alias la='ls -la'
alias lt='ls --tree'
alias kubectl="minikube kubectl --"

# fd-find
alias fd="fdfind --hidden --follow --exclude .git"

# bat
alias bat="batcat"

# =============================
# Node Version Manager (NVM)
# =============================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# =============================
# fzf Configuration
# =============================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_CTRL_T_COMMAND='fdfind --type f'

# Cleaner fzf UI with minimal distractions

export FZF_DEFAULT_OPTS=" \
--border=rounded \
--height=20% \
--no-info \
--prompt='❯ ' \
--pointer='▶' \
--marker='✓' \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--color=border:#363a4f,label:#cad3f5 \
--color=gutter:#24273a \
--no-hscroll \
--preview-window=hidden \
--cycle \
--tabstop=4 \
--layout=reverse
"

# Open nvim in file
bindkey -s '^N' 'selected_file=$(fd --type f | fzf) && [ -n "$selected_file" ] && nvim "$selected_file"\n'

# Fast directory jump
bindkey -s '^G' 'selected_dir=$(fd --type d | fzf) && [ -n "$selected_dir" ] && cd "$selected_dir"\n'

# Fuzzy kill process with more details
bindkey -s '^K' 'kill -9 $(ps -eo pid,user,pcpu,pmem,time,comm | sort -k 3 -r | fzf | awk '\''{print $1}'\'')\n'

# Fuzzy git branch checkout
bindkey -s '^B' 'git branch | fzf | xargs git checkout\n'

# Docker FZF management function
fzf_docker() {
  local action=$(echo "ps logs exec stop start restart rm stats" | tr " " "\n" | fzf --prompt="Docker action: ")
  
  case "$action" in
    ps)
      docker ps ;;
    logs)
      docker logs -f $(docker ps --format "{{.Names}}" | fzf --prompt="Select container: ") ;;
    exec)
      docker exec -it $(docker ps --format "{{.Names}}" | fzf --prompt="Select container: ") /bin/bash ;;
    stop|start|restart|rm|stats)
      docker $action $(docker ps -a --format "{{.Names}}" | fzf --prompt="Select container: ") ;;
  esac
}

# Bind to Ctrl+D
bindkey -s '^D' 'fzf_docker\n'

# =============================
# Plugins
# =============================
eval $(thefuck --alias)

source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


