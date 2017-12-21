set -x GOPATH /home
for d in /usr/local/bin /usr/local/go/bin /home/bin
  if [ ! -d $d ]; continue; end
  if not contains $d $PATH
    set -U fish_user_paths $d $fish_user_paths
  end
end
