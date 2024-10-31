vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true

vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.scrolloff = 10

-- cursorline
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "81"

-- modelines (bad for security)
vim.opt.modelines = 1

-- hide buffers, not close them
vim.opt.hidden = true

-- maintain undo history between sessions
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- scroll bounds
vim.o.scrolloff = 13

-- fuzzy find
vim.opt.path:append("**")

-- lazy file name tab completion
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildoptions = 'pum'

-- ignore files nvim does not use
vim.opt.wildignore:append(".git,.hg,.svn")
vim.opt.wildignore:append(".aux,*.out,*.toc")
vim.opt.wildignore:append(".o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class")
vim.opt.wildignore:append(".ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp")
vim.opt.wildignore:append(".avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg")
vim.opt.wildignore:append(".mp3,*.oga,*.ogg,*.wav,*.flac")
vim.opt.wildignore:append(".eot,*.otf,*.ttf,*.woff")
vim.opt.wildignore:append(".doc,*.pdf,*.cbr,*.cbz")
vim.opt.wildignore:append(".zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb")
vim.opt.wildignore:append(".swp,.lock,.DS_Store,._*")
vim.opt.wildignore:append(".,..")
vim.opt.wildignore:append(" */node_modules/* ")

-- use markdown syntax highlighting for mdx
-- no mdx treeshitter support yet?
vim.cmd([[au BufRead,BufNewFile *.mdx set filetype=markdown]])

-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- make backspaces behave in a sane manner
vim.opt.backspace = "indent,eol,start"

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- use indents of 2
vim.opt.shiftwidth = 2

-- tabs
vim.opt.expandtab = false

-- an indentation every 2 columns
vim.opt.tabstop = 2

-- let backspace delete indent
vim.opt.softtabstop = 2

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = "set nopaste"
})

-- add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
