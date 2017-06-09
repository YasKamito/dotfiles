
## return value
RC_OK=0
RC_ERROR=1
RC_CANCEL=2
RC_KEYNOTFOUND=3

set_to_gitconfig()
{
	cat << EOF
[include]
	path = ~/dotfiles/_gitconfig
EOF
}

## gitconfig settings
grep -e gitconfig ~/.gitconfig > /dev/null
if [[ $? -ne ${RC_OK} ]]
then
	echo "Set to gitconfig"
	set_to_gitconfig >> ~/.gitconfig
else
	echo "Gitconfig settings is already enabled"
fi

