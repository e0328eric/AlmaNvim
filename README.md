# AlmaNvim
This is my personal neovim configuration which can easily install in most computers.
I test the bootstrap at both my macos machine and the arch linux virtual machine.

It needs Neovim 0.12 or newer: plugins are managed by the builtin package manager
(`:help vim.pack`), so there is nothing else to bootstrap.

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

All plugins are downloaded on the first start of neovim.

## Plugins
The plugin list lives in `lua/almagest/plugins.lua` and each plugin is configured in
`after/plugin/<name>.lua`. Plugins are installed into `~/.local/share/nvim/site/pack/core/opt`.

| Command | What it does |
| --- | --- |
| `:PackUpdate [name ...]` | Download updates and show them in a confirmation buffer. `:write` applies them, `:quit` discards them. |
| `:PackClean` | Delete plugins from disk that were removed from `lua/almagest/plugins.lua`. |

The installed revisions are recorded in `nvim-pack-lock.json`. It is ignored by git; remove it from
`.gitignore` and commit it if you want every machine to use exactly the same plugin revisions.

## Colorscheme
The colorscheme setting is in `after/plugin/colorscheme.lua`. Since I am using
[wezterm](https://wezfurlong.org/wezterm/) with background image, the colorscheme is set by
transparent background.
If you do not want to use transparent background image, remove `tribela/vim-transparent` plugin from
`lua/almagest/plugins.lua`, restart neovim and run `:PackClean`.
```lua
return {
	-- ...
	gh("tribela/vim-transparent"), -- remove or comment this line
	-- ...
}
```
