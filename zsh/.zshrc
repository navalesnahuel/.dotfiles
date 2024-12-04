# Paths
[ -d "/opt/nvim-linux64/bin" ] && export PATH="$PATH:/opt/nvim-linux64/bin"
[ -d "/opt/wezterm/bin" ] && export PATH="$PATH:/opt/wezterm/bin"
[ -d "/var/lib/flatpak/app/org.wezfurlong.wezterm/x86_64/stable/.../bin" ] && export PATH="$PATH:/var/lib/flatpak/app/org.wezfurlong.wezterm/x86_64/stable/.../bin"

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="$PATH:/opt/nvim-linux64/bin"

if [ -d "/usr/local/go" ]; then
    export GOROOT="/usr/local/go"
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH"
fi

# Promp Configuration
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{magenta}%m%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
fi

# Aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias windows='sudo grub-reboot "Windows" && sudo reboot'
unalias ls 2>/dev/null
alias ls='lsd'
alias l='ls -l'
alias la='ls -la'
alias lt='ls --tree'
alias vim="nvim"
alias dockerd='/opt/docker-desktop/bin/docker-desktop'
