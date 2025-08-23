# ===============================
# Paths & Tool Setup
# ===============================

# Erlang & Elixir
export KERL_CONFIGURE_OPTIONS="--without-wx"
source /opt/erlang/28.0/activate
export PATH="/opt/elixir/bin:$PATH"

# Bun
export PATH="/opt/bun/bin:$PATH"

# ===============================
# Plugins
# ===============================
# Autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax Highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ===============================
# Prompt (Minimal, colored)
# ===============================
autoload -Uz colors && colors
# Minimal colored prompt: [user@host cwd] $
# ===============================
# Prompt Enhancements: Time, CPU Load, Exit Status
# ===============================
function zsh_prompt_info() {
    local exit_status=$?
    local cpu_load=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1 | xargs)
    local today="%F{cyan}$(date +'* %d.%m / %a / %H:%M *')%f"
    local status_str=""
    [[ $exit_status -ne 0 ]] && status_str="%F{red}✗$exit_status%f"
    local cpu_str="%F{yellow}⏱$cpu_load%f"
    echo "%{${today}%} %{${cpu_str}%} %{${status_str}%}"
}
# PROMPT character: $ for normal, # for root
PROMPT='%{%B%}%{%F{yellow}%}%n@%m%{%f%} $(zsh_prompt_info)
%~ > '

# Zsh Options
# ===============================
setopt histignorealldups sharehistory inc_append_history
setopt auto_menu menu_complete
setopt autocd
setopt auto_param_slash
setopt no_case_glob no_case_match
setopt globdots
setopt extended_glob
setopt interactive_comments
setopt PROMPT_SUBST
stty stop undef

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/zsh_history
HISTCONTROL=ignoreboth

# ===============================
# Keybindings
# ===============================
bindkey -e  # Use emacs keybindings
bindkey '^A' beginning-of-line      # Ctrl+A -> beginning of line
bindkey '^E' end-of-line            # Ctrl+E -> end of line
bindkey '^[b' backward-word         # Alt+B -> previous word
bindkey '^[f' forward-word          # Alt+F -> next word

# ===============================
# Completion System
# ===============================
autoload -Uz compinit && compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ===============================
# Aliases
# ===============================
alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ll='ls -lahG'
alias gs='git status'
alias gc='git commit'
alias gp='git push'

# ===============================
# fzf (Fuzzy Finder) Integration
# ===============================
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi
