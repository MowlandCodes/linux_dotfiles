# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/mowlandcodes/.zsh/completions:"* ]]; then export FPATH="/home/mowlandcodes/.zsh/completions:$FPATH"; fi
# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l --all"
eval "$(starship init zsh)"
source /home/mowlandcodes/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
alias cd="z"
alias cat="batcat"
. "/home/mowlandcodes/.deno/env"
alias gdiff="git diff | delta"
alias src="source ~/.zshrc"
alias c="clear"


# Generated for pdtm. Do not edit.
export PATH=$PATH:/home/mowlandcodes/.pdtm/go/bin
source <(fzf --zsh)

# Bind CTRL + T to FZF search for files, including hidden ones
fzf_open_in_nvim() {
    while true; do
      local file
      file=$(fd . --type f --hidden | fzf --preview 'batcat --color=always --style=numbers {}' --preview-window=right:50% --height 40% --ansi --reverse --prompt 'Search Files -> ') || return
      [ -z "$file" ] && break 

      nvim "$file"
    done
}

zle -N fzf_open_in_nvim_widget fzf_open_in_nvim
bindkey '^T' fzf_open_in_nvim_widget

# Bind ALT + C to FZF search for directory, and change to it
fzf_cd_with_dirtree() {
    local dir
    dir=$(fd . --type d --hidden | fzf --preview 'tree -C {}' --preview-window=right:50% --height 60% --ansi --reverse --prompt 'Navigate Directory -> ' --bind "ctrl-u:preview-up,ctrl-d:preview-down") || return
    [ -n "$dir" ] && cd $dir 
}

zle -N cd_with_dirtree_widget fzf_cd_with_dirtree
bindkey '^[c' cd_with_dirtree_widget

export FZF_DEFAULT_COMMAND="find . -type f "
export FZF_DEFAULT_OPTS="--reverse --border --preview 'batcat -n --color=always {}' --preview-window '' --height 50% --ansi"

