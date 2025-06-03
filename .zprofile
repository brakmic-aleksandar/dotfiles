# Import machine specific settings
[[ -f ~/.machineprofile ]] && source ~/.machineprofile

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/env:/Library/TeX/texbin/"

export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"

export EDITOR=nvim