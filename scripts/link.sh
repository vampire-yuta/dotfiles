#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

# linklist.txtのコメントを削除
__remove_linklist_comment() {(
    # '#'以降と空行を削除
    sed -e 's/\s*#.*//' \
        -e '/^\s*$/d' \
        $1
)}


# OSの判定
detect_os() {
    case "$(uname -s)" in
        Darwin)
            echo "mac"
            ;;
        Linux)
            echo "linux"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# シンボリックリンクを作成
create_symlinks() {
    os=$1
    #cd ${dotfiles_root}/dotfiles
    linklist="${os}/linklist.txt"
    [ ! -r "$linklist" ] && return
    echo $linklist
    __remove_linklist_comment "$linklist" | while read target link; do
        target=$(eval echo "${PWD}/${target}")
        link=$(eval echo "${link}")
	echo ${link}
        mkdir -p $(dirname ${link})
        ln -fsn ${target} ${link}
    done
}

os=$(detect_os)
echo $os
create_symlinks $os
