#!/bin/sh

install_packages(){
  sudo apt-get -y install fish neovim jq unzip direnv powerline python3-pip npm fzf
}

install_fisher(){
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install dracula/fish
}

install_vimplug(){
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_nvm(){
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
}

install_go(){
	rm -fr ~/.goenv git clone https://github.com/syndbg/goenv.git ~/.goenv
	sudo add-apt-repository ppa:longsleep/golang-backports
	sudo apt update -y
	sudo apt install golang -y
	go version
	git clone https://github.com/syndbg/goenv.git ~/.goenv
}

install_win32yank(){
  wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
  unzip win32yank-x64.zip
  sudo mv win32yank.exe /usr/local/bin/win32yank.exe
  chmod +x /usr/local/bin/win32yank.exe
  rm -fr win32yank-x64.zip
}

install_peco(){
  # https://obel.hatenablog.jp/entry/20240510/1715292000
  wget https://github.com/peco/peco/releases/download/v0.5.11/peco_linux_amd64.tar.gz
  tar xvzf peco_linux_amd64.tar.gz
  sudo mv ./peco_linux_amd64/peco /usr/local/bin/
  rm -fr peco_linux_amd64
  rm -fr peco_linux_amd64.tar.gz
}


#install_packages
install_fisher
install_vimplug
install_nvm
install_go
#install_win32yank
install_peco
