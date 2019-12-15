# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
curl -o- -L https://raw.githubusercontent.com/lmk123/oh-my-wechat/master/install.sh | bash -s
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


cur_dir=$HOME/.config/zsh
home_path="/Users/"$(whoami)""
zshrc_path="$home_path/.zshrc"

rm "$zshrc_path"
ln -s "$cur_dir/.zshrc" "$zshrc_path"