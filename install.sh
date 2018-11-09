#!/bin/sh

  # 安装 cocoapods
  installCocoapods() {

    gem list | grep cocoapods >/dev/null
    if [[ $? -ne 0 ]]; then
        sudo gem install cocoapods
    fi

  }

  # 安装homebrew
  installHomebrew() {
     	brew --version >/dev/null
      if [[ $? -ne 0 ]]; then
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      fi
  }

  # 安装oh-my-zsh
  installOhmyzsh() {
    ls -la ~/ | grep .zshrc
    if [[ $? -ne 0 ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

        # 修改style
        ZSH_THEME=cat ~/.zshrc | grep "ZSH_THEME=\"*\""
        sed -i "" "s/$ZSH_THEME/ZSH_THEME="ys"" ~/.zshrc

        # 直接生效
        source ~/.zshrc

    fi

  }

main() {
  installCocoapods
  installHomebrew
  installOhmyzsh
}


main
