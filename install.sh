#!/bin/bash
## Dotfiles install script: Marc Hibbins (@marchibbins)
## Modifed by Gareth Foote (@gaffafoote) on 29/11/12

# Symlink dotfiles in home directory, similar to:
# https://github.com/holman/dotfiles
# https://github.com/jferris/config_files

ignore_files="install.sh readme.md"

for name in *; do
    target="$HOME/.$name"
    overwrite=0
    backup=0
    skip=0

    if [[ "$ignore_files" == *"$name"* ]]; then
        continue
    else
        echo -n "Install $target? (y, n): "
        read install_file
        if [ $install_file != "y" ]; then
            continue
        fi
    fi

    if [ -e "$target" ]; then
        echo -n "File already exists: '$target', what do you want to do? [s]kip, [o]verwrite, [b]ackup: "
        read option
        case $option in
            o) overwrite=1;;
            b) backup=1;;
            s) echo "- File skipped"
               skip=1;;
            *) echo "Command not recognised, file skipped"
               continue;;
        esac
        if [ "$overwrite" = 1 ]; then
            echo "- Removing $target"
            rm "$target"
        fi
        if [ "$backup" = 1 ]; then
            echo "- Backing up to $target.backup"
            mv "$target" "$target".backup
        fi
    fi
    
    if [ "$skip" != 1 ]; then
        echo "Creating $target"; echo ""
        ln -s "$PWD/$name" "$target"
    fi
done

echo "Intall Vundle for vim? [Y/n]"
read yno
case $yno in
    [yY] | [yY][Ee][Ss] ) 
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        ;;
    *) echo "Not installed."
                    ;;
esac

# OS Specific install. To do: Linux
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  echo "Install Brew, Iterm2, ZSH and OhMyZSH for macOS? [Y/n]"
  read yno
  case $yno in
      [yY] | [yY][Ee][Ss] ) 
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
          # https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
          # https://gist.github.com/kevin-smets/8568070
          brew cask install iterm2
          brew install zsh
          sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
          # The installation script should set zsh to your default shell
          chsh -s $(which zsh)
          ;;
      *) echo "Not installed."
                      ;;
  esac
elif [[ "$unamestr" == 'Linux' ]]; then
  echo "linux"
fi
