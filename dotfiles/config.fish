# ----------
# Starship prompt
# ----------
starship init fish | source

# ----------
# OS Detection
# ----------
if string match -q "*microsoft*" (uname -r)
    set -g IS_WSL true
end

# ----------
# PATH
# ----------

# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"
alias tf="terraform"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"

# Go
set -x PATH $PATH:/usr/local/go/bin
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
eval (goenv init - | source)
set -x PATH $GOPATH/bin $PATH
set -x GO111MODULE on

# krew
set -gx PATH $PATH $HOME/.krew/bin

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# istio (バージョンに合わせて変更)
if test -d $HOME/istio-1.17.2/bin
    export PATH="$PATH:$HOME/istio-1.17.2/bin"
end

# ----------
# Editor
# ----------
set -x EDITOR vim
alias vim="nvim"
alias vi="nvim"

# ----------
# Aliases
# ----------
alias g="git"
alias ..="cd ../"
alias ide="sh $HOME/.tmux/ide.sh"

# Kubernetes
alias k="kubectl"
alias ki="kubectl-iexec"
alias kn="kubectl-ns"
alias kc="kubie ctx"
alias kube-busybox="kubectl run -i --tty busybox --image=busybox --generator=run-pod/v1 --rm -- sh"

# Docker
alias d="docker"
alias doc="docker-compose"
function docker_rm_by_name
    set -l name $argv[1]
    docker ps -a -q -f name=$name | xargs docker rm -f
end
alias drm='docker_rm_by_name'

# ----------
# Tools
# ----------
eval (direnv hook fish)

# mysql
export MYSQL_HISTFILESIZE=10000000

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# ----------
# WSL specific
# ----------
if set -q IS_WSL
    alias clip="clip.exe"
    alias getip="curl ifconfig.io | clip.exe"
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
    export VAGRANT_HOME="$HOME/.vagrant.d"
    export PATH="$PATH:/mnt/c/Windows/System32:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
    export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
    export PATH="$PATH:/opt/mssql-tools/bin"

    # VS Code (Windows側のバイナリを使用)
    fish_add_path "/mnt/c/Users/yuta/AppData/Local/Programs/Microsoft VS Code/bin"
end
