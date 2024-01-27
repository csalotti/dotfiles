source ~/.fish_aliases
source ~/.fish_variables
functions -c fish_prompt _old_fish_prompt
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

fish_add_path /usr/local/opt/tcl-tk/bin
fish_add_path /Users/chris/.istio/istio-1.12.0/bin

zoxide init fish | source 
starship init fish | source

set -g theme_newline_cursor yes

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chris/Dev/perso/tools/google-cloud-sdk/path.fish.inc' ]; . '/Users/chris/Dev/perso/tools/google-cloud-sdk/path.fish.inc'; end
