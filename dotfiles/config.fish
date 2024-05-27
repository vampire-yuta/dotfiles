
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end


# fish_prompt
function fish_prompt
  echo -n (set_color cyan)(prompt_pwd) (set_color green)'❯'
 
  # Git
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

set fish_theme agnoster

# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"
alias tf="terraform"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"

# goenv
set -x PATH $PATH:/usr/local/go/bin

set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
eval (goenv init - | source)
set -x PATH $GOPATH/bin $PATH
set -x GO111MODULE on

set -gx PATH $PATH $HOME/.krew/bin

set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
powerline-setup

set -x EDITOR vim
eval (direnv hook fish)

# vim
alias vim="nvim"
alias vi="nvim"

# kubernetes
alias kube-busyboxy="kubectl run -i --tty busybox --image=busybox --generator=run-pod/v1 --rm -- sh"

# istio
export PATH="$PATH:/home/yuta/istio-1.17.2/bin"

# ClipBoard
alias clip="clip.exe"
alias getip="curl ifconfig.io | clip.exe"

# node version
#nvm use v17.0.0 > /dev/null

# tmux セッションがなければ開く
function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session \; source-file ~/.tmux/session.conf
        return
    end

    set new_session "Create New Session" 
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session \; source-file ~/.tmux/session.conf
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end


alias ide="sh $HOME/.tumx/ide.sh"
alias g="git"
alias k="kubectl"
alias ki="kubectl-iexec"
alias kn="kubectl-ns"
alias kc="kubectl-ctx"
alias ..="cd ../"
alias d="docker"
alias doc="docker-compose"
function docker_rm_by_name
    set -l name $argv[1]
    docker ps -a -q -f name=$name | xargs docker rm -f
end
alias drm='docker_rm_by_name'
#alias gdate="date"

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"

#export GEM_HOME=$HOME/.gem
#export GEM_PATH=$HOME/.gem
#rvm default


# mssql
export PATH="$PATH:/opt/mssql-tools/bin"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH



# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish


# k9s
