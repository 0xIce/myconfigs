cur_dir=$HOME/.config/nvim
vimrc_path=$HOME/.vimrc
vim_path=$HOME/.vim


rm $vim_path
rm $vimrc_path

ln -s $cur_dir $vim_path
ln -s $cur_dir/init.vim $vimrc_path