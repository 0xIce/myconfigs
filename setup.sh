
for file in ./*
do
    if test -d $file
    then
        if [[ -e "$file"/setup.sh ]]; then
            sh "$file"/setup.sh
        fi
    fi
done