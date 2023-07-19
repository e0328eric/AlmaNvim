# AlmaNvim
This is my personal neovim configuration which can easily install in most computers.
I test the bootstrap at both my macos machine and the arch linux virtual machine.

## Installation
If you use some previous configuration, run the following commands.
```console
mv ~/.local/share/nvim ~/.local/share/nvim-backup
mv ~/.config/nvim ~/.config/nvim-backup
```

Then run this command to install. You need `git` program to install this.
```console
git clone https://github.com/e0328eric/AlmaNvim.git ~/.config/nvim
```

## Colorscheme
The colorscheme setting is in `after/plugin/colorscheme.lua`. Since I am using
[wezterm](https://wezfurlong.org/wezterm/) with background image, the colorscheme is set by
transparent background.
If you do not want to use transparent background image, remove `tribela/vim-transparent` plugin from
`lua/almagest/plugin.lua`.
```lua
return {
    -- ...
	"tribela/vim-transparent", -- remove or comment this line
    -- ...
}
```
