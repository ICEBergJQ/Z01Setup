image_path="$HOME/zone01-config/Background.jpeg"
# theme list ls -d /usr/share/themes/* |xargs -L 1 basename
theme_color='Yaru-purple-dark'
#Clones the settings repo
git clone https://github.com/ICEBergJQ/Z01Setup.git ~/zone01-config && cd ~/zone01-config/ && mv .p10k.zsh ~/.p10k.zsh && mv .zshrc ~/.zshrc
# clones zsh theme 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# small script to set up git for first use and to rembember your info in the future
zsh git_setup.sh
# forward to zsh whenever termenial started
printf "SHELL=/bin/zsh\nexec /bin/zsh -l\n" >> ~/.bashrc
# applies the background on both light and dark mode
gsettings set org.gnome.desktop.background picture-uri-dark "file://${image_path}"
gsettings set org.gnome.desktop.background picture-uri "file://${image_path}"
# Changes theme Color
gsettings set org.gnome.desktop.interface gtk-theme $theme_color
