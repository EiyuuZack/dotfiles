#
# ~/.bash_profile
#

# set up shared folder with windows host
# (uncomment when running Arch as guest)
[[ ! -d "$HOME/dropbox" ]] && [[ -d /media/sf_Dropbox ]] && ln -s /media/sf_Dropbox $HOME/dropbox

# Enable color support for ls
eval "$(dircolors -b /etc/DIR_COLORS)"

#==================== EXPORTS ====================#

# Test for acpi, supposedly the 1 client that gets added is X itself
# because acpid started before X, or acpid checks for $XAUTHORITY or something
#export XAUTHORITY=$HOME/.Xauthority

# Ignore duplicate commands in bash history and store up to 1000 entries
export HISTCONTROL=ignoreboth
export HISTSIZE=1000

# Add directories to $PATH
[[ -d "$HOME/bin" ]] && export PATH=$PATH:$HOME/bin
[[ -d "$HOME/.rvm" ]] && export PATH=$PATH:$HOME/.rvm/bin
[[ -d "$HOME/.local/heroku" ]] && export PATH=$PATH:$HOME/.local/heroku/bin

# Set vim as the default editor
export EDITOR=vim

# Set git to show dirty state on repositories
# and position relative to upstream
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWUPSTREAM=auto

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X
if [[ -z "$DISPLAY" ]] && [[ $(tty) == /dev/tty1 ]]; then

    # Set Firefox as the default browser
    # and vim as the visual editor
    # also set xfce as DE to improve program compatibility
    # i.e Skype (opening urls)
    export BROWSER=firefox
    #export DE=xfce # exported in .xinitrc
    export VISUAL=vim

    startx
    logout
fi
