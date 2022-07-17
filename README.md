# Dotfiles

```
$ cd ~
$ git clone --recursive https://github.com/F-Ruxton/dotfiles
$ cd dotfiles
$ ./base/install.sh
$ ./install
```

## TODO

- Use rsync to copy bash aliases and tmux config to remote
  - Do not copy git dirs or tmux/resurrect directory
  - Do not delete remote tmux/resurrect directory

- Swap Trouble and Treesitter which-keys t<->T
- Aliases for remote debugging

Remote debug:

send python debugpy command to terminal for current file (map path)
open tunnel on second terminal if not already open
start dap for current file
