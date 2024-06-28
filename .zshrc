# if in tmux do not run fastfetch
if [ -z "$TMUX" ]; then
  fastfetch
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q
 
# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd j zsh)"

# Alias definitions
alias vim='nvim' # Use neovim as vim
alias vi='nvim'  # Use neovim as vi
alias v='nvim'   # Use neovim as v
alias cp='cp -i' # Confirm before overwriting something
alias mv='mv -i' # Confirm before overwriting something
alias rm='trash -v' # Move to trash instead of deleting
alias mkdir='mkdir -p' # Create parent directories if they don't exist
alias rmd='/bin/rm --recursive --force --verbose' # Remove directory and its contents
alias la='ls -ltr'                # show hidden files
alias ls='ls --color=always' # add colors and file type extensions
alias lsa='ls -aFh --color=always' # add colors and file type extensions
alias x='exit' # Quick exit
alias c='clear'
alias cd..='cd ..' # Go up one directory
alias ex='yazi'
export SUDO_EDITOR="nvim"
alias "sudoedit"='function _sudoedit(){sudo -e "$1";};_sudoedit'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$PATH:/usr/lib/jvm/java-22-openjdk/bin
export EDITOR=nvim

# run rust files with run command
run() {
    if [[ $1 == *.rs ]]; then
        rustc "$1" && "./${1%.rs}"
    elif [[ $1 == *.rc ]]; then
        rustc "${1%.*}.rs" && source "$1" && "./${1%.*}"
    elif [[ $1 == *.java ]]; then
        javac "$1" && java "${1%.java}"
    else
        echo "Please provide a .rs, .rc, or .java file"
    fi
}
