if exists('g:base16_nvim')
	finish
endif
let g:base16_nvim = 1

augroup color
	autocmd!
	autocmd ColorScheme *
	\ lua require('plugin.colors').setup_highlight()
	autocmd VimEnter,FocusGained *
	\ lua require('plugin.colors').check_colorscheme()
augroup END
