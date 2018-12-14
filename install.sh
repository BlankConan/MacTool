#!/usr/bin/expect

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
    ls -la ~/ | grep .oh-my-zsh >/dev/null
    if [[ $? -ne 0 ]]; then

        echo "----------------oh-my-zsh 安装中....----------------"

        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

        echo "----------------oh-my-zsh 安装完成----------------"

    fi
  }

  modify_oh_my_zsh_theme() {

    ls -la ~/ | grep .oh-my-zsh >/dev/null
    if [[ $? -ne 0 ]]; then
      echo "----------------oh-my-zsh 设置主题中...----------------"
      # 修改style
      ZSH_THEME=`cat ~/.zshrc | grep "ZSH_THEME=\"*\""`
      sed -i "" "s/$ZSH_THEME/ZSH_THEME="ys"" ~/.zshrc

      # 直接生效
      source ~/.zshrc
      echo "----------------oh-my-zsh 修改主题----------------"

    fi
  }

  ffmpengALl() {
  	brew install ffmpeg --with-chromaprint --with-fdk-aac --with-fontconfig --with-freetype --with-frei0r --with-game-music-emu --with-libass --with-libbluray --with-libbs2b --with-libcaca --with-libebur128 --with-libgsm --with-libmodplug --with-libsoxr --with-libssh --with-libvidstab --with-libvorbis --with-libvpx --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-opus --with-rtmpdump --with-rubberband --with-schroedinger --with-sdl2 --with-snappy --with-speex --with-tesseract --with-theora --with-tools --with-two-lame --with-wavpack --with-webp --with-x265 --with-xz --with-zeromq --with-zimg

    # 重新安装上面的功能
    #brew reinstall ffmpeg --with-chromaprint --with-fdk-aac --with-fontconfig --with-freetype --with-frei0r --with-game-music-emu --with-libass --with-libbluray --with-libbs2b --with-libcaca --with-libebur128 --with-libgsm --with-libmodplug --with-libsoxr --with-libssh --with-libvidstab --with-libvorbis --with-libvpx --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-opus --with-rtmpdump --with-rubberband --with-schroedinger --with-sdl2 --with-snappy --with-speex --with-tesseract --with-theora --with-tools --with-two-lame --with-wavpack --with-webp --with-x265 --with-xz --with-zeromq --with-zimg
  }

main() {
  installOhmyzsh
  modify_oh_my_zsh_theme
  installCocoapods
  installHomebrew
}


main
