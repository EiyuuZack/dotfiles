#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Check terminal size
shopt -s checkwinsize

[[ -d $HOME/.bash/aliases ]] && . $HOME/.bash/aliases

for file in $HOME/.bash/completions ; do
  . $file
done
unset file

. $HOME/.terminal_files/termprompts # source prompt chooser
. $HOME/.terminal_files/funcs # source useful functions

# Set color variables {{{
fgblk="$(tput setaf 0)"		# Black - Regular
fgred="$(tput setaf 1)"		# Red
fggrn="$(tput setaf 2)"		# Green
fgylw="$(tput setaf 3)"		# Yellow
fgblu="$(tput setaf 4)"		# Blue
fgpur="$(tput setaf 5)"		# Purple
fgcyn="$(tput setaf 6)"		# Cyan
fgwht="$(tput setaf 7)"		# White
bfgblk="$(tput setaf 8)"	# Black - Intense
bfgred="$(tput setaf 9)"	# Red
bfggrn="$(tput setaf 10)"	# Green
bfgylw="$(tput setaf 11)"	# Yellow
bfgblu="$(tput setaf 12)"	# Blue
bfgpur="$(tput setaf 13)"	# Purple
bfgcyn="$(tput setaf 14)"	# Cyan
bfgwht="$(tput setaf 15)"	# White
bgblk="$(tput setab 0)"		# Black - Background
bgred="$(tput setab 1)"		# Red
bggrn="$(tput setab 2)"		# Green
bgylw="$(tput setab 3)"		# Yellow
bgblu="$(tput setab 4)"		# Blue
bgpur="$(tput setab 5)"		# Purple
bgcyn="$(tput setab 6)"		# Cyan
bgwht="$(tput setab 7)"		# White
bbgblk="$(tput setab 8)"	# Black - Background - Intense
bbgred="$(tput setab 9)"	# Red
bbggrn="$(tput setab 10)"	# Green
bbgylw="$(tput setab 11)"	# Yellow
bbgblu="$(tput setab 12)"	# Blue
bbgpur="$(tput setab 13)"	# Purple
bbgcyn="$(tput setab 14)"	# Cyan
bbgwht="$(tput setab 15)"	# White
normal="$(tput sgr0)"	# text reset
undrln="$(tput smul)"	# underline
noundr="$(tput rmul)"	# remove underline
mkbold="$(tput bold)"	# make bold
mkblnk="$(tput blink)"	# make blink
revers="$(tput rev)"	# reverse
# }}}

# Prompt shell customization
# PROMPT_COMMAND is called before PSX variables
PROMPT_COMMAND=prompt

# Little welcoming message for every new shell opened
welcome

#==================== BINDINGS ====================#

# These options are usually put in ~/.inputrc (local user),
# but can be added here by single quoting the command and
# prepending with 'bind'

# Auto-expand ! combinations upon hitting space
bind 'Space:magic-space'

# Make up/down keys auto-complete
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Shows all possible completions with one Tab key press instead of two
#bind 'set show-all-if-ambiguous on'

# Ignore case when completing
bind 'set completion-ignore-case on'

# Suppress the equal part (prefix) of similar names if said
# similar part (prefix) is longer than 2 chars when completing
bind 'set completion-prefix-display-length 2'

# Treat hyphens and underscores equally when completing
bind 'set completion-map-case on'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
