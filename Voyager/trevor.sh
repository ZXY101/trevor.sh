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
	echo "Background";
	cp sw.jpg ~/;
	osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/goinfre/stenner/sw.jpg"';
	echo "Clear Dock";
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
echo "VS Code"
cp settings.json ~/Library/Application\ Support/Code/User/
git config --global core.excludesfile ~/.gitignore;
echo "Gitignore";

echo "${blue}${bold}----- Github -----${normal}";
echo "Would you like to clone a repo?"
read gbool;
if [ "$gbool" = "y" ] || [ "$gbool" = "Y" ]
then
	read -p 'Github username: ' guser;
	read -p 'Repo Name: ' repo;
	git clone "https://github.com/${guser}/${repo}" ~/Desktop/${repo}
else
	echo "Aight";
fi
echo "${green}${bold}----- Finished -----${normal}";
exec bash;
exit 0
