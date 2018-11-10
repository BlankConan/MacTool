#!/bin/expect

  password="666"


  # 安装 cocoapods
  installCocoapods() {

    gem list | grep cocoapods >/dev/null
    if [[ $? -ne 0 ]]; then

        echo "----------------cocoapods 安装中....--------------"
        sudo gem install cocoapods
        echo "----------------cocoapods 安装完成----------------"

        # 初始化仓库
        echo "初始化仓库...."
        pod setup
        echo "----------------仓库初始化完成----------------"
    fi

  }

  # 安装homebrew
  installHomebrew() {
     	brew --version >/dev/null
      if [[ $? -ne 0 ]]; then

          echo "----------------Homebrew 安装中......------------"

          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

          echo "----------------Homebrew 安装完成----------------"
      fi
  }

  # 安装oh-my-zsh
  installOhmyzsh() {
    ls -la ~/ | grep .zshrc >/dev/null
    if [[ $? -ne 0 ]]; then

        echo "----------------oh-my-zsh 安装中....----------------"

        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

        # 修改style
        ZSH_THEME=cat ~/.zshrc | grep "ZSH_THEME=\"*\""
        sed -i "" "s/$ZSH_THEME/ZSH_THEME="ys"" ~/.zshrc

        # 直接生效
        source ~/.zshrc

        echo "----------------oh-my-zsh 安装完成----------------"
    fi
  }

  # 自动授权
  auto_authorization() {
    expect -c "
      set timeout 10

      expect {
          \"yes/no\" {send yes\r; expect "*assword" send {$password\r}}
          \"password\" {send $password\r}
      }
      expect eof
    "
  }

main() {
  installOhmyzsh
  installCocoapods
  installHomebrew
}


main
