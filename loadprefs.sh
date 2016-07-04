#INSTRUCTIONS
# 1. type the following manually
# sudo apt-get -y update
# sudo apt-get -y install gcc make
# 2. mount the guest additions CD and run VBoxLinuxAdditions.run
# 3. reboot the guest machine (lubuntu)
# 4. create a folder called 'share' on host and share it with guest (and put a file in it so you know it worked when it mounts)
# 5. copy this script in and run it


# Backup files being modified
echo "Backing up config files..."
cp ~/.bash_aliases ~/.bash_aliases~
cp ~/.bashrc ~/.bashrc~
cp ~/.tmux.conf ~/.tmux.conf~
cp ~/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap~
cp ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings~
cp /etc/ssh/ssh_config /etc/ssh/ssh_config~

# Shorten the bash prompt
echo "Please enter name of new computer: "
read computername
sed -i "s/@\\h/@$computername/g" ~/.bashrc
sed -i "s/\\w/\\W/g" ~/.bashrc

# prevent ssh connection drops
sudo chmod 600 ~/.ssh/config
sudo echo "" >> /etc/ssh/ssh_config
sudo echo "ServerAliveInterval 240" >> /etc/ssh/ssh_config

# Make it easy to pipe to the clipboard
sudo apt-get -y install xclip
echo "" >> ~/.bash_aliases
echo "alias clip='xclip -selection c'" >> ~/.bash_aliases

# Improve diffs
sudo apt-get -y install colordiff
# echo "" >> ~/.bash_aliases
# echo "alias diff='colordiff'" >> ~/.bash_aliases

# Make ls nice
echo "" >> ~/.bash_aliases
echo "alias ls='ls --color=auto --group-directories-first'" >> ~/.bash_aliases
echo "alias la='ls -A'" >> ~/.bash_aliases
echo "alias ll='ls -lah --group-directories-first'" >> ~/.bash_aliases
echo "alias l.='ls -d .* --color=auto'" >> ~/.bash_aliases

# Make apt-get not ask for confirmation
echo "" >> ~/.bash_aliases
echo "alias apt-get='apt-get -y'" >> ~/.bash_aliases

# Eternal bash history (http://stackoverflow.com/a/19533853)
echo "" >> ~/.bashrc
echo "export HISTFILESIZE=" >> ~/.bashrc
echo "export HISTSIZE=" >> ~/.bashrc
echo "export HISTTIMEFORMAT='[%F %T] '" >> ~/.bashrc
echo "export HISTFILE=~/.bash_eternal_history" >> ~/.bashrc
echo "PROMPT_COMMAND='history -a; $PROMPT_COMMAND'" >> ~/.bashrc

# Reload .bashrc
source ~/.bashrc


# Mount the shared directory and put a shortcut in home directory
sudo mkdir /media/share
sudo mount -t vboxsf share /media/share
ln -s /media/share ~/share

# Install audio packages
sudo apt-get -y install amixer festival

# Install some useful packages
sudo apt-get -y install build-essential sox  git curl xbitmaps xmessage
sudo -H pip install e speedtest-cli when-changed

# Set up github info
git config --global user.name "AlexLamson"
git config --global user.email "alex.lamson@gmail.com"
git config --global push.default simple

# Update pip
sudo pip install --upgrade setuptools pip
sudo pip3 install --upgrade pip

# Install sublime text
sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt-get -y update && sudo apt-get -y install sublime-text-installer

# Install useful python libraries
sudo apt-get -y install python-pyqt5 python3-pyqt5
sudo apt-get -y build-dep python-matplotlib && sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-numpy python-scipy scikit-learn

# Install pybrain
sudo apt-get -y install ipython ipython-notebook python-pandas python-sympy python-nose
sudo pip install pybrain
