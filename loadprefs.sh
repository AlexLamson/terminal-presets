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
cpalways() { cp $1 $2 2>/dev/null || : ; return 0 ; }
cpalways ~/.bash_aliases ~/.bash_aliases~
cpalways ~/.bashrc ~/.bashrc~
cpalways ~/.tmux.conf ~/.tmux.conf~
cpalways ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap~
cpalways ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings~
cpalways /etc/ssh/ssh_config /etc/ssh/ssh_config~


# Ask user for computer name to use in bash prompt
echo "Please enter name of new computer: "
read computername


# Copy over and reload .bash_aliases
sudo cp files/bash_aliases/bash_aliases ~/.bash_aliases

# Copy over and reload .bashrc
sudo sed "s/COMPUTERNAME/$computername/g" files/bashrc/bashrc > ~/.bashrc
unset computername
source ~/.bashrc


# Mount the shared directory and put a shortcut in home directory
read -r -p "Would you like to link the shared directory? [y/N] " response
response=${response,,}    # tolower
if [[ $response =~ ^(yes|y)$ ]]
then
    echo "linking shared directory"
    sudo mkdir /media/share
    sudo mount -t vboxsf share /media/share
    sudo ln -s /media/share ~/share
else
    echo "not linking shared directory"
fi


# Copy over and reload ssh_config
sudo chmod 600 ~/.ssh/config
sudo cp files/ssh/ssh_config /etc/ssh/ssh_config
sudo service sshd restart


# Copy over and reload tmux settings
sudo apt-get -y -qq install tmux
sudo cp files/tmux/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf


# Set up github info
git config --global user.name "AlexLamson"
git config --global user.email "alex.lamson@gmail.com"
git config --global push.default simple


# Just in case it somehow got this far without updates
sudo apt-get -qq update


# Update pip
sudo apt-get -y -qq install python-pip
sudo apt-get -y -qq install python3-pip
sudo -H pip install --upgrade setuptools pip
sudo -H pip3 install --upgrade pip

# Install sublime text
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 && sudo apt-get -y -qq update && sudo apt-get -y -qq install sublime-text-installer
cp files/sublime-text-3/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
cp files/sublime-text-3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings


# Make it easy to pipe to the clipboard
sudo apt-get -y -qq install xclip

# Improve diffs
sudo apt-get -y -qq install colordiff

# Install audio packages
sudo apt-get -y -qq install festival

# Install some useful packages
sudo apt-get -y -qq install sox git curl xbitmaps tree
sudo -H pip install e speedtest-cli when-changed


# Install useful python libraries
sudo apt-get -y -qq install python-bs4 python3-bs4
sudo apt-get -y -qq install build-essential python-dev python-numpy python-setuptools python-scipy libatlas-dev libatlas3-base
sudo apt-get -y -qq install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo apt-get -y -qq install python-pyqt5 python3-pyqt5
sudo -H pip install -U scikit-learn

# Install pybrain
sudo apt-get -y -qq install ipython ipython-notebook python-pandas python-sympy python-nose
sudo pip install pybrain

