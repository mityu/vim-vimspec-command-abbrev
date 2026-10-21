#!/usr/bin/env bash

if which themis >/dev/null; then
	: "${THEMIS_VIM_DIR:=$(dirname $(dirname $(realpath $(which themis))))}"
	export THEMIS_VIM_DIR
fi
vim -u NONE -e -s -n -N -S "$(dirname "${BASH_SOURCE[0]}")/genftplugin.vim"
