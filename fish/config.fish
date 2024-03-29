# Aliases
# Python
alias python python3
# Go to directory from the searched file
alias sd "cd ~ && cd (find * -type d | fzf)"
alias sdev "cd ~/Dev  && cd (find * -type d | fzf)"

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


## Inits
starship init fish | source

# Functionis
source $HOME/.config/fish/functions/python.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

