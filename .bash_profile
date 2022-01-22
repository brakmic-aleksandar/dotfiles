#
# ~/.bash_profile
#

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/env"
export EDITOR=nvim

if [ -f ~/.bashrc ]; then 
    source ~/.bashrc 
fi


. "$HOME/.cargo/env"
