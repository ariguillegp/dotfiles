Before executing any script in this folder you need to (default setting is for Fedora):

sudo dnf install -y python lua vim curl tmux git bash-completion

Then run the scripts in the following order:

./install-golang
./install
./install-root


install-root sets root user with the same prompt and vim configuration as the current user
