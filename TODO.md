To Do
=====

Files To Sync
-------------
 * `~/.ssh/authorized_keys`
 * `~/.tmux.conf`
 * `~/.config/openbox/lubuntu-rc.xml`
   * `http://askubuntu.com/questions/305767/how-i-can-create-shortcut-for-maximize-minimize-window-in-lubuntu`
 * `/etc/updatedb.conf`
   * `http://askubuntu.com/questions/592162/locate-does-not-locate-files`
 * `~/backup.sh`
 * `~/.ssh/config`

Things To Add
-------------
 * scala
 * repeat the same settings as apt-get for apt
 * `calc () { python3 -c "print('{}'.format($@))"; }`
 * on startup, run the command `sudo mount -t vboxsf share ~/share/`
 * pressing enter when asked for a new name should result in keeping the current name
 * commands to copy the above files
 * sublime text keybinds, settings, package control
 * a command which sets the number of desktops to 4
 * rsub: `http://log.liminastudio.com/writing/tutorials/sublime-tunnel-of-love-how-to-edit-remote-files-with-sublime-text-via-an-ssh-tunnel`
 * python machine learning libraries
   * tensorflow
   * theano
 * command to backup files before they are modified
 * `alias tree="tree -C"` to .bashrc
 * a command in the README which downloads and runs this all automatically
 * a keepalive command to the ssh config so connections don't time out
   * add to `ServerAliveInterval 60` /etc/ssh/ssh_config
 * permanent ssh key authentication
   * `http://stackoverflow.com/a/28562679/2230446`
 * tensorflow
 * keras
 * torch

Things To Do
------------
 * figure what was causing the issue where the shared directory wasn't mounting
   * maybe the mount command needs to be included in the .bashrc ?
 * make sure this works as expected by running it on a fresh VM
 * make sure running the script twice isn't different from running it once
 * make sure things simple things are aliases, medium complexity things are functions and very complex things are scripts
 * make sure everything is well commented
 * generalize the format of the script with variables and such so other people can easily use it too

