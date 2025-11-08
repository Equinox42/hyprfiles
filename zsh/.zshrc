# ---------------------------
# -- HISTORY --
# ---------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_IGNORE_SPACE # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS # Don't save duplicate lines
setopt SHARE_HISTORY # Share history between sessions

# ---------------------------
# -- KEYBINDS --
# ---------------------------

bindkey -e

# Ctrl + Left Arrow move from one word to another like in bash
bindkey '^[[1;5D' backward-word

# Ctrl + Right Arrow move from one word to another like in bash
bindkey '^[[1;5C' forward-word

# Case Insensitive Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


zstyle :compinstall filename '$HOME/.zshrc' 
autoload -Uz compinit
compinit

# ---------------------------
# -- FUNCTIONS  --
# ---------------------------

function mkcd () {
     mkdir "$1" && cd "$1"
}

# ---------------------------
# -- PLUGINS && FILES --
# ---------------------------

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/.zsh_colors
source $HOME/.config/zsh/.zsh_aliases

# ---------------------------
# -- FUZZY FINDER --
# ---------------------------

# Color Scheme daemon theme

export FZF_DEFAULT_OPTS='--color=fg:#ebfafa,hl:#FAD691 --color=fg+:#ebfafa,hl+:#FFF3CD --color=info:#5fa9f4,prompt:#5fa9f4,pointer:#5fa9f4 --color=marker:#7081d0,spinner:#f7c67f,header:#323449 --border="rounded" --reverse'
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
bindkey "^[t" fzf-file-widget  # Alt-T = ^[t
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--style full --height 80% --preview 'bat --theme=Nord --color=always -n --line-range :500 {}'"

source <(fzf --zsh)

# ---------------------------
# -- STARSHIP -- 
# ---------------------------

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"


export TERM=xterm-256color
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export VISUAL=vim
export EDITOR="$VISUAL"
