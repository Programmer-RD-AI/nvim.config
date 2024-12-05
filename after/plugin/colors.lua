function ColorMyPencils(color)
    additional_vim_regex_highlighting = false,
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
