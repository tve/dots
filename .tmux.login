if-shell "(($(tmux display -p '#{session_many_attached}') > 0))" \
  choose-session \
  "run-shell \"tmux choose-session \\\"switch-client -t '%%'; kill-session -t '(tmux display -p '#S')'\\\"\""

# From https://unix.stackexchange.com/questions/342658/in-tmux-how-can-i-replace-the-current-session-by-selecting-another-and-killing
# I've used shell expressions (another answer that did not use the shell would be great!).
# First I use Tmux's if-shell to decide whether there are multiple attached clients.
# If there are then I just invoke the standard choose-session command.
#
# However, if this is the only client attached to the session, I pass a custom command to
# choose-session but I do it in shell (with run-shell) so that I can build the command-line
# passed to choose-session.
#
# That command-line is built of two commands:
#
# switch-client -t '%%' which is what choose-session uses by default (see man tmux for an
# explanation).
# kill-session -t '$(tmux display -p '#S')' first uses a subshell to get the name of the
# current session (it hasn't yet been destroyed) and passes that as a parameter to kill-session.
# The final command requires lots of escaping to make it work. The if-shell takes three
# arguments: a shell command and two tmux commands. These need to be quoted if they contain
# whitespace. Therefore, the third argument run-shell... is quite nasty!
