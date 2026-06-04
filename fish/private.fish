# Variables
# This prevents me from installing packages with pip without being
# in a virtualenv first.
#
# This allows me to keep my system Python clean, and install all my
# packages inside virtualenvs.
#
# See https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
# See https://blog.glyph.im/2023/08/get-your-mac-python-from-python-dot-org.html#and-always-use-virtual-environments
set -g -x PIP_REQUIRE_VIRTUALENV true
set -g -x CXX clang++
set -g -x CC clang

set -g -x KHOME $HOME/Dev/free/kering

## Starships
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

# Functions
source $HOME/.config/fish/functions/python.fish
source $HOME/.config/fish/functions/kering.fish

# PATH
# Created by `pipx` on 2024-04-15 09:48:51
set PATH $PATH /Users/chris/.local/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chris/Softwares/google-cloud-sdk/path.fish.inc' ]; . '/Users/chris/Softwares/google-cloud-sdk/path.fish.inc'; end

# Aliases
# Python

alias python python3
# Go to directory from the searched file
alias sd "cd (find * -type d | fzf)"
alias vim=nvim
alias vimconf="nvim $HOME/.config/nvim/init.lua"
alias tf="terraform"

# Kering aliases
alias cdkering="cd $KHOME"
alias kinfra="cd $KHOME/data-platform-infrastructure && nvim"
alias kci="cd $KHOME/data-platform-ci_workflows && source python_ci_scripts/.venv/bin/activate.fish && nvim"
alias ktrans="cd $KHOME/data-platform-infrastructure_transversal && source dags/.venv/bin/activate.fish && nvim"
alias kexplo="cd $KHOME/data-platform-infrastructure_exploration && nvim"
alias ktodo="cd $KHOME/todo && nvim TODO.md"

