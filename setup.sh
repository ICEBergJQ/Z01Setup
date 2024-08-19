image_path="$HOME/zone01-config/Background.jpeg"

# theme list ls -d /usr/share/themes/* |xargs -L 1 basename
#Clones the settings repo
if [ -d "~/zone01-config/" ]; then
    echo -e "Directory ~/zone01-config/ already exists. Overwriting..."
    # Remove existing directory and clone the repository
    rm -rf "~/zone01-config/"
fi
git clone https://github.com/ICEBergJQ/Z01Setup.git ~/zone01-config && cd ~/zone01-config/

#Move the premade p10k settings and zshrc
mv .p10k.zsh ~/.p10k.zsh && mv .zshrc ~/.zshrc

# clones zsh theme 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# small script to set up git for first use and to rembember your info in the future
zsh git_setup.sh

# applies the background on both light and dark mode
gsettings set org.gnome.desktop.background picture-uri-dark "file://${image_path}" 2>/dev/null
gsettings set org.gnome.desktop.background picture-uri "file://${image_path}" 2>/dev/null
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null

# Changes theme Color
zsh set_theme.sh

# Makes you use french and english layouts
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'fr')]" > /dev/null 2>&1

# change display and terminal font
zsh set_font.sh

# forward to zsh whenever termenal auto-start bash
printf "SHELL=/bin/zsh\nexec /bin/zsh -l\n" >>~/.bashrc
