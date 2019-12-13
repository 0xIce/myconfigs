cur_path="$HOME/.config/Alfred/Alfred.alfredpreferences"
preference_path="$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences"

rm "$preference_path"

ln -s "$cur_path" "$preference_path"
