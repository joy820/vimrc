# vimrc
My vimrc(neovim) and related config

# Install
1. This vimrc is configured for neovim, though it may be possible to adapt to the latest vim. Thus you need to install neovim first. On Ubuntu: 
sudo apt install neovim 
(After 18.04). For other distributions/OS, please checkout neovim installation guide.

2. If you work with python, strongly recommend you run :checkhealth in neovim after you install it. And you can see whether you have correct package dependencies for python. Checkout :help in neovim for more help info.

3. Install dependencies for Coc-vim, which is a fantastic language server related plugin that helps you do auto-completion, go-to-definition etc. The actuall installation of coc-vim will be conducted by PlugInstall, but before that, let's make sure you have node.js: 
curl -sL install-node.now.sh/lts | bash

4. I use a fantastic plugin manager: vim-plug. It will be automatically installed once you link this vimrc to your neovim. To do so, you need to copy/link this vimrc into the following path: ~/.config/nvim/init.vim and then open your neovim. 

5. To install all the plugin, open ~/.config/nvim/init.vim with neovim, and then run :PlugInstall

6. Most of the plugin should work right away. Two remaining things are colorscheme and coc-vim. I'm using a customized version of NORD colorscheme, which requires 256-true-color terminal and probably work best when you also specify your terminal with NORD. Feel free to change the colorscheme as you wish. For coc-vim, see step 7.

7. Coc-vim use coc-settings.json to specify it's configurations. Copy/link the coc-settings.json in this repo to ~/.config/nvim/coc-settings.json and it should work.

# Some quick notes of key-mapping
1. <LEADER> is space.
2. ; is mapped to : This is for easily typing vim commands
3. <LEADER>w and <LEADER>q serves :w and :q.
4. <LEADER>f serves fuzzy finds file name in this workspace, <LEADER>fl serves fuzzy finds lines in this file, <LEADER>f<Ctrl>l finds lines in all files in this workspace
5. gd is go-to-definition.
6. \# serves as \*
7. In normal modes, e maps to w.
8. arrow-key will adujsts window size
9. <Ctrl> hjkl in Normal mode will switch panes, in Insert mode will serve as arrow-key
10. In insert mode, <Ctrl>q will find the previous nearest mis-spelling vocabulary, replace it with the suggestions without moving your cursor.
