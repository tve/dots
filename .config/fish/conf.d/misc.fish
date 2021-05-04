set fish_greeting ""
set -x GPG_TTY (tty)
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'

# The following poersist due to -U but they're here so they propagate to hosts
set -Ux LANGUAGE en_US.UTF-8
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
