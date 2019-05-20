#!/usr/bin/sh 

bold=$(tput bold);
blue=$(tput setaf 6);
green=$(tput setaf 2);
normal=$(tput sgr0);

OS="`uname`"
case $OS in
  'Linux')
    echo "${blue}${bold}----- Linux -----${normal}";
    read -p 'WTC Username: ' uservar;
    echo "export USER=$uservar" >> ~/.bashrc;
    ;;
  'Darwin')
    echo "${blue}${bold}----- MacOS -----${normal}";
    echo "DarkMode";
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true';
    defaults write com.apple.dock static-only -bool true; killall Dock;
    cp .bashrc ~/;
echo "Aliases";
    ;;
  *) ;;
esac

echo "${blue}${bold}----- Global -----${normal}";
echo "Bashrc";
cp -R .vim ~/;
echo "Color + 42Header";
cp .vimrc ~/;
echo "Vimrc";
cp .gitignore ~/;
git config --global core.excludesfile ~/.gitignore;
echo "Gitignore";

echo "${blue}${bold}----- Github -----${normal}";
read -p 'Github username: ' guser;
read -p 'Repo Name: ' repo;
git clone "https://github.com/${guser}/${repo}" ~/Desktop/${repo}

echo "${green}${bold}----- Finished -----${normal}";
exec bash;
exit 0
