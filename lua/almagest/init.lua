require("almagest.set")
require("almagest.remap")

vim.cmd([[
if exists("g:neovide")
    set guifont=FiraCode\ Nerd\ Font:h14
    let g:neovide_scale_factor = 1.0
    let g:neovide_hide_mouse_when_typing = v:true
    let g:neovide_fullscreen = v:true
endif
]])

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local dir = vim.fn.fnamemodify(event.match, ":p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p") -- "p" creates parent dirs like `mkdir -p`
		end
	end,
})
