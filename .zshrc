# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Check if the shell is interactive
if [[ $- != *i* ]]; then
  return
fi

# Source global definitions
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi


# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Alias definitions
alias vim='nvim' # Use neovim as vim
alias vi='nvim'  # Use neovim as vi
alias v='nvim'   # Use neovim as v
alias cp='cp -i' # Confirm before overwriting something
alias mv='mv -i' # Confirm before overwriting something
alias rm='trash -v' # Move to trash instead of deleting
alias mkdir='mkdir -p' # Create parent directories if they don't exist
alias rmd='/bin/rm --recursive --force --verbose' # Remove directory and its contents
alias la='exa -a --color=auto --icons=auto --sort=name'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias x='exit' # Quick exit

# # Automatically install the needed support files for this .zshrc file
# install_zshrc_support() {
#   local dtype
#   dtype=$(distribution)
#
#   if [ $dtype == "redhat" ]; then
#     sudo yum install multitail tree joe
#   elif [ $dtype == "suse" ]; then
#     sudo zypper install multitail tree joe
#   elif [ $dtype == "debian" ]; then
#     sudo apt-get install multitail tree joe
#   elif [ $dtype == "gentoo" ]; then
#     sudo emerge multitail tree joe
#   elif [ $dtype == "mandriva" ]; then
#     sudo urpmi multitail tree joe
#   elif [ $dtype == "slackware" ]; then
#     echo "No install support for Slackware"
#   else
#     echo "Unknown distribution"
#   fi
# }
#
export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"


if [ -f "/usr/share/autojump/autojump.zsh" ]; then
  . /usr/share/autojump/autojump.zsh
elif [ -f "/usr/share/autojump/autojump.bash" ]; then
  . /usr/share/autojump/autojump.bash
else
  echo "can't find the autojump script"
fi

export PATH="$PATH:/opt/nvim-linux64/bin"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fuck)

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
