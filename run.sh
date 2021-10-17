#!/usr/bin/env zsh

# 1. Install all the required packages for the new OS
cd installs || exit 1
./installs.sh

# 2. Write something to delete the initial files not owned by stow
cd .. || exit 1
find configs/* ! -path "*bin*" -type f | cut -d"/" -f3- | while read -r f; do rm "$HOME/$f"; done

# 3. Stow your dotfiles
cd configs || exit 1
for d in *; do
    if [[ $d == "bin" ]]; then
      sudo stow -R -t "/usr/local/bin" "$d"
    else
      stow -R -t "$HOME" "$d"
    fi
done

# 4. All done
exit 0
