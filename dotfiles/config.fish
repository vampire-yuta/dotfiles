set -g theme_color_scheme dracula # カラーテーマを dracula に

# ----------
# bobthefish config
# ----------
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor no  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch を表示
set -g theme_color_scheme dracula
set -g theme_display_date yes
set -g theme_display_cmd_duration yes  # コマンド実行時間の非表示
set -g theme_display_date yes
set -g theme_display_virtualenv no
set -g theme_display_vi yes
set -g theme_display_k8s_context no

# peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

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
alias kc="kubie ctx"
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

# venv
source ~/venv/bin/activate.fish
