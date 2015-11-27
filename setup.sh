FNAME=.bashrc
RC_NORMAL=0
RC_NOTEXISTS=1
RC_SYMBOLIC=2
RC_FILE=3

create_sv_file()
{
	OLD_FNAME=$1
	SV_FNAME=${OLD_FNAME}.sv
	if [ -e ${SV_FNAME} ]; then
		CNT=0
		SV_FNAME_CP=${SV_FNAME}.${CNT}
		while [ -e ${SV_FNAME_CP} ]
		do
			CNT=$((${CNT} + 1 ))
			SV_FNAME_CP=${SV_FNAME}.${CNT}
		done
		SV_FNAME=${SV_FNAME_CP}
	fi
	echo ${SV_FNAME}
	cp -p ${OLD_FNAME} ${SV_FNAME}
}

file_check()
{
	if [ -e $1 ]; then
		if [ -L $1 ]; then
			echo $1 is symbolic link
			return ${RC_SYMBOLIC}
		else
			echo $1 is not symbolic link
			create_sv_file $1
			return ${RC_FILE}
		fi
	else
		echo $1 not exists
		return ${RC_NOTEXISTS}
	fi
}

# vimrc setting
FNAME=~/.vimrc
file_check ${FNAME}
if [ $? -eq ${RC_FILE} -o $? -eq ${RC_NOTEXISTS} ]; then
	ln -s ~/dotfiles/_vimrc ${FNAME}
fi

# bashrc setting
FNAME=~/.bashrc
file_check ${FNAME}
if [ $? -eq ${RC_FILE} -o $? -eq ${RC_NOTEXISTS} ]; then
	ln -s ~/dotfiles/_bashrc ${FNAME}
fi

# ctags setting
FNAME=~/.ctags
file_check ${FNAME}
if [ $? -eq ${RC_FILE} -o $? -eq ${RC_NOTEXISTS} ]; then
	ln -s ~/dotfiles/_ctags ${FNAME}
fi

# gitconfig setting
./setgconf.sh
