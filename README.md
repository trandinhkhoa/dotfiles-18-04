### Essential, duh! (GNU make, etc.)
```
sudo apt-get install build-essential #for YouCompleteMe, vimproc
sudo apt-get install cmake   #for YouCompleteMe
sudo apt-get install python-dev python3-dev #for YouCompleteMe
```

### Install zsh
```
sudo apt-get install zsh
chsh -s $(which zsh)
```
Logout here, then
```
echo $SHELL //expect /usr/bin/zsh
sudo apt-get install curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### [zsh plugin]zsh-syntax-highlight 
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### snazzy theme for zsh 
```
git clone https://github.com/tobark/hyper-snazzy-gnome-terminal.git
cd hyper-snazzy-gnome-terminal
chmod +x hyper-snazzy.sh && ./hyper-snazzy.sh
```

### install color theme for terminal
https://github.com/Mayccoll/Gogh
```
$  bash -c  "$(wget -qO- https://git.io/vQgMr)"
```

### Switch Capslock <-> Esc 
Install dconf-tools. Go to
`dconf-tools` >> `org` >> `gnome` >> `desktop` >> `input-sources`
Enter
```
['caps:swapescape']
```

### Install neovim 
```
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
<!-- make .init.vim in .config/nvim -->
```
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
```

### Prerequisite for neovim's plugins 
<!-- for recursive searching with unite -->
```
sudo apt-get install silversearcher-ag
```

### check true color support 
```
curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
```
<!-- OR -->
```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```

### .tmux.conf 
truecolor in tmux
```
set -sa terminal-overrides ",*256col*:Tc"
```

### Install Powerline fonts 
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
(basically copy `fonts` to `~/.fonts` or `~/.local/share/fonts`)
(Terminal Font: Source Code Pro for Powerline Medium 13)
(UI Font: Roboto )

## Powerline ##
### Install Powerline 
NOTE: need to add $HOME/.local/bin to $PATH so that pip can install executable into that folder
```
sudo apt-get install python3-pip
pip3 install powerline-status
```
### for zsh (I use agnoster though) 
Paste this at the end of `.zshrc`
```
source /home/khoa/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
```
### for tmux 
Paste this to `.tmux.conf`
```
run-shell "powerline-daemon -q"
source "$HOME/.local/lib/python3.6/site-packages/powerline/bindings/tmux/powerline.conf"
```

### Ubuntu Software 
Install Suspend Button
Install GNOME Tweaks
<!-- Install Dash to Panel -->
Install User Themes
Install Dash to Dock (Opacity 70%)
Install Hide Activities Button
Install Custom Corner
<!-- Install No Title Bar -->

### Move Titlebar buttons to Left (GNOME Tweak >> Windows >> Titlebar Buttons)

## themes ##
```
mkdir ~/.themes/
```
Download themes, paste to `~/.themes/`
Download icon pack, paste to `~/.icons/`

### Hide Terminal's menu bar 
Right clich anywhere in the terminal -> Show Menubar
### numix
```
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
```
### Ant
https://www.gnome-look.org/p/1099856/

###McOS-MJV
(Choose `MacOS-MJV` and `Shell`)
https://www.gnome-look.org/p/1241688/

###OSX Icons (Mojave)
https://www.gnome-look.org/p/1102582/


### Fix dashed line GTK3 
paste this line to  `~/.config/gtk-3.0/gtk.css` (Create the file if not found)
```
undershoot.top, undershoot.right, undershoot.bottom, undershoot.left { background-image: none; }
```
then restart

### TODO: latex 
if require xelatex or luatex
create this file in the working folder
.latexmkrc
A: Instead of putting the settings in your ~/.latexmkrc file, put them in your
   document's working directory, in a file named either latexmkrc or .latexmkrc: >
	$pdflatex = 'xelatex %O %S'
TODO: re-install latex
```
sudo apt-get install latexmk
sudo apt-get install texlive-science
sudo apt-get install texlive-latex-extra
```
Then have LatexBox plugin in your `.vimrc`

OR

https://tex.stackexchange.com/questions/95483/how-to-remove-everything-related-to-tex-live-for-fresh-install-on-ubuntu
https://www.tug.org/texlive/quickinstall.html

- install tex live
- Install latex box
- sudo apt-get update
sudo apt-get install latexmk
- leader + ll for compile
- leader + lv -> show pdf
- leader + le -> error
- install zathura pdf viewer
sudo apt-get update
sudo apt-get install zathura
- Install any latex package
tlmgr init-usertree
sudo apt-get install xzdec
tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final

Example: Install fancyvrb
tlmgr install fancyvrb

 <C> set installation collections:
     40 collections out of 41, disk space required: 5533 MB

 <D> set directories:
   TEXDIR (the main TeX directory):
     /usr/local/texlive/2018
   TEXMFLOCAL (directory for site-wide local files):
     /usr/local/texlive/texmf-local
   TEXMFSYSVAR (directory for variable and automatically generated data):
     /usr/local/texlive/2018/texmf-var
   TEXMFSYSCONFIG (directory for local config):
     /usr/local/texlive/2018/texmf-config
   TEXMFVAR (personal directory for variable and automatically generated data):
     ~/.texlive2018/texmf-var
   TEXMFCONFIG (personal directory for local config):
     ~/.texlive2018/texmf-config
   TEXMFHOME (directory for user-specific files):
     ~/texmf
### Install GIMP
```
cd ~
sudo apt-get install gimp
git clone https://github.com/nathan-osman/gimp-webp
sudo apt-get install libgimp2.0-dev libwebp-dev
cd gimp-webp
mkdir build
cd build
cmake ..
make
sudo make install
```
### Install SublimeText 
```
sudo dpkg -i sublime-text_build-3126_amd64.deb
sudo apt-get -f install
```
Enter license key (`sublimeLicense.txt`)
Enable VI mode: Preference > Settings. Add this to User's settings:
```
    "ignored_packages": [],
    "vintage_start_in_command_mode": true,
    "update_check": false
```

### gnome-mpv, youtube-dl 
sudo apt-get install gnome-mpv
pip3 install --upgrade youtube-dl

### OPTIONAL: RVM -> Ruby 
https://github.com/rvm/ubuntu_rvm
```
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
```
Now, in order to always load rvm, change the Gnome Terminal to always perform a login.
At terminal window, click `Terminal` > `Preferences`, `Commands` and check `Run command as login shell`.
Restart.
```
rvm install ruby
rvm --default use ruby
```

### TODO: move changes to $PATH from .zshrc to .profile 

### psensors 
```
sudo apt-get install lm-sensors hddtemp
sudo sensors-detect # yes to everything, it's fine I guess
sensors # check if everything seems alright
sudo apt-get install psensor
```

## NOTE ##
### [Vim's Plugin] YouCompleteMe 
Without a "-std=<something>" flag, clang won't know which
language to use when compiling headers. So it will guess. Badly. So C++
headers will be compiled as C headers. You don't want that so ALWAYS specify
a "-std=<something>".
For a C project, you would set this to something like 'c99' instead of
'c++11'.
" For more information about compliling with semantic support for other
" languages, see https://valloric.github.io/YouCompleteMe/
" For C-family languages support, read the notes OR the file ".ycm_extra_conf.py" OR "https://valloric.github.io/YouCompleteMe/#intro" (search `Provide the flags manually`)

```
sudo apt-get install clang
```

create a .ycm_extra_conf file at this location
`~/.vim/.ycm_extra_conf.py`

### [Vim's Plugin] syntastic 
python3 -m pip install flake8

configure flake8: create file `~/.config/flake8`
http://flake8.pycqa.org/en/latest/user/configuration.html
```
[flake8]
ignore = E501,E111,E114,E121,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E221,E222,E241,E251,E261,E303,E402,W503
max-complexity = 10
max-line-length = 80
```
E501: line too long

### numpy for python3 
pip3 install numpy

if there is problem (YouCompleteMe does not work w/ numpy)
`
export PYTHONPATH=$HOME/.local/lib/python3.6/site-packages
`
Then do `:PlugInstall!` inside nvim,
Then restart the machine.

### Use pip3 to install tensorflow -> keras 

### neofetch (view system information)
sudo apt-get install neofetch

# ISSUES ##

### neovim terminal
https://github.com/kassio/neoterm/issues/156

### dock appear on lock screen, 2 docks on dash screen 
`https://github.com/micheleg/dash-to-dock/issues/726`
temporary fix:
A temporary fix is to restart gnome-shell with alt+f2 then r and enter.

permanent fix(not sure of side effects)
I have Gnome Tweak Tool (sudo apt install gnome-tweak-tool) and under 'Extensions' there's a place where you can disable it. In my experience, this did not work. I ended up going to /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com/ and breaking the extension by changing the metadata.json file's name.

```
cd /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com
sudo mv metadata.json metadata1.json
```

### FIXED: skype icon does not follow themes 
look for `/var/lib/snapd/desktop/applications/skype_skypeforlinux.desktop`
Change this line
```
Icon=
```
to
```
Icon=skypeforlinux
```
Of course you first need a file named skypeforlinux.svg (or png) in your icon theme

### FIXED: skype still appears in dash search after uninstallation 
remove `/var/lib/snapd/desktop/applications/skype_skypeforlinux.desktop`


### FIXED: bad splash screen after removing desktop environmen (GNOME .etc) / Reset Plymouth
```
sudo subl -H /etc/default/grub
```
Find this line
```
#GRUB_GFXMODE=640x480
```
and change for this one (of course choose your resolution)
```
GRUB_GFXMODE=1440x900
GRUB_GFXPAYLOAD_LINUX=keep
```
Save file and type in terminal
```
 echo FRAMEBUFFER=y | sudo tee /etc/initramfs-tools/conf.d/splash
 sudo update-initramfs -u
 sudo update-grub
```

### FIXED: remove desktop environment (GNOME in this case)
First, select a Desktop environment other than GNOME. Then,
```
sudo apt-get purge gnome-session
sudo apt-get udpate
sudo apt-get autoremove
```
then make sure ubuntu session and gdm3 are still installed

### FIXED: change ls color 
https://askubuntu.com/questions/17299/what-do-the-different-colors-mean-in-ls
https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
<!-- Solution -->
Paste this to .zshrc
```
LS_COLORS=$LS_COLORS:'ow=0;35:' ; export LS_COLORS
```

### TODO: backup 
- /home/khoa/.themes/McOS-Light-Shell/gnome-shell/gnome-shell.css
    McOS-Dark-Shell
<!-- lockscreen setup -->
<!-- picture file name must not have space -->
- ~/Downloads/stwaskpass

### Disable bluetooth by default
disable
```
sudo systemctl disable bluetooth.service
```
on next restart, check status
```
sudo systemctl status  bluetooth.service
```
enable again
```
sudo systemctl enable bluetooth.service
```

### Install Signal messenger
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key ad
d -
 echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main
" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
 sudo apt update && sudo apt install signal-desktop
 /opt/Signal/signal-desktop --import

### TODO: re download Meslo font

### install xdotool
```
sudo apt-get install xdotool
```
put this in Customcorner extension
```
xdotool set_desktop --relative -- -1 
xdotool set_desktop --relative 1 
```
