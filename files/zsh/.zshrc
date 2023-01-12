
bindkey -e
zstyle :compinstall filename '/home/sebastian/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

 # Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-exports-enc"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
   
# enable ssh-agent 
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 10h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

export SDKMAN_DIR="/home/sebastian/.sdkman"
[[ -s "/home/sebastian/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sebastian/.sdkman/bin/sdkman-init.sh"

eval "$(zoxide init zsh --cmd j)"
eval "$(starship init zsh)"

# key bindings 

bindkey "^U" backward-kill-line

