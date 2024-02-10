# Joshs .config

> Restarting with simplicity

This config includes configuration for [Neovim](https://neovim.io), tmux and z-shell. All of which should be switchable between different ui (color and font) themes. Supported themes will [Gruvbox Dark]() and [Catppuccin]() in all four variants.

## Links n Stuff

- [ZSH documentation](https://zsh.sourceforge.io/Doc/Release/zsh_toc.html)
- [Nerdfont Cheatsheet](https://www.nerdfonts.com/cheat-sheet)

## Painpoints

* Neovim keybindings
* Tmux Knowledge
* Working with paste buffers in Neovim (replace for instance)


## General Key Maps

I intend to have a key map that is logical throughout all application layers and thus would be best to be described here.
It would also be cool to keep things close to established standards so that I can still move on foreign systems.

- Neovim Stuff should start with [leader]
- Tmux stuff should start with [CTRL+b] or [CTRL+z]


## Stuff Outside

- iTerm2
    -> margins should be x18,y20
- [ ] find a window manager that works well


### Window Manager Needs

Theese Setups are needed:

- Comm Stuff: A Space where all my communication software (email, chat, etc.) lives
- Browser: Full screen complete browsing
- Web Dev: Two Panel Layout of The Terminal with tmux+neovim on the left and a _naked_ brower on the right
- Mobile Dev: Same as WebDev but having the Mobile Emulator on the right
- Zen Mode: Terminal in full screen, but with big margins left and right, as that the text passage stays narrow enough



## Neovim

Thoughts about my (ideal?) nvim

## Keys

* **Only** use leader mappings that don't have a modification mapping without leader
* Use simple mnemonics

There are a few _categories_ that my make up the basic of my leader mappings:

- finding the right file to open
- jumping between symbols in a project
- code/language related actions and diagnostics
- navigating between symbols in the open buffer
- explore the project

- [ ] Whichkey
- [ ] Telescope
- [ ] Treesitter
- [ ] LSPConfig


## Notes

- I don't know if _oh-my-z_ is really providing enough benefit.
