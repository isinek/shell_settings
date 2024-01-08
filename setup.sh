#!/bin/bash

SETUP_REV="v1.2"

modules=( "bash" "tmux" "vim" "nvim" )

# Source files
bash_sources=( .bash_profile .bashrc.user .bash_aliases )
tmux_sources=( .tmux.conf )
vim_sources=( .vimrc )
nvim_sources=( .config/nvim )

# File destinations
bash_destinations=( $HOME/.bash_profile $HOME/.bashrc.user $HOME/.bash_aliases )
tmux_destinations=( $HOME/.tmux.conf )
vim_destinations=( $HOME/.vimrc )
nvim_destinations=( $HOME/.config/nvim )

setup_backup=1
install=( "bash" "tmux" "nvim" )
tmp_dir=tmp_shell_settings


print_help()
{
	echo "Usage:"
	echo "    $0 [options] [module [module ...]]"
	echo "Options:"
	echo "    -h, --help    - this help text"
	echo "    -c, --clean   - clean setup, no backup"
	echo "Modules:"
	for m in ${modules[*]}
	do
		echo "    ${m}"
	done
}

info()
{
	echo "INFO: $@"
}

error()
{
	echo "ERROR: $@"
}

download_fail()
{
	error "Unable to download settings from GitHub repo!"
	exit 1
}

backup_fail()
{
	error "backup of $1 failed!"
	exit 1
}

setup_fail()
{
	error "setup of $1 failed!"
	exit 1
}

install_module()
{
	module="$1"
	sources="${module}_sources[*]"
	sources=(${!sources})
	destinations="${module}_destinations[*]"
	destinations=(${!destinations})

	for i in $( seq 0 $(( ${#sources[@]} - 1 )) )
	do
		source=${sources[$i]}
		destination=${destinations[$i]}

		if [ -n "${setup_backup}" ] && [ -f ${destination} ]
		then
			cp ${destination}{,.bak} || backup_fail "${destination}"
			info "${destination} backed up to ${destination}.bak"
		elif [ -n "${setup_backup}" ] && [ -d ${destination} ]
		then
			tar -cvzf ${destination}{_bak.tar.gz,} || backup_fail "${destination}"
			info "${destination} backed up to ${destination}_bak.tar.gz"
		elif [ ! -f ${source} ] && [ ! -d ${source} ]
		then
			error "Ooops, source '${source}' does not exist!"
			return
		fi

		cp -rf ${source} ${destination} || setup_fail "${module}"
	done
	info "Module ${module} is ready"
}


if [[ " $* " =~ " -h " ]] || [[ " $* " =~ " --help " ]]
then
	print_help
	exit 0
elif [[ " $* " =~ " -c " ]] || [[ " $* " =~ " --clean " ]]
then
	setup_backup=
fi

if [ $# -gt 0 ]
then
	install=( $* )
fi

mkdir -p ${tmp_dir}
pushd ${tmp_dir} > /dev/null

release_filename="${SETUP_REV}.tar.gz"
wget https://github.com/isinek/shell_settings/archive/refs/tags/${release_filename}
if [ ! -f "${release_filename}" ]
then
	download_fail
fi
tar -xvzf "${release_filename}"
cd ./shell_settings*

for m in ${install[*]}
do
	echo "${m}"
	if [[ ! " ${modules[@]} " =~ "${m}" ]]
	then
		echo "Module ${m} not available!"
		continue
	fi

	install_module "${m}"
done

popd > /dev/null
rm -rf ${tmp_dir}

