#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="mongodb"
TOOL_TEST="mongod --help"

current_script_path=${BASH_SOURCE[0]}
util_dir=$(dirname "$current_script_path")

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	"$util_dir/m" ls
}

list_stable_version() {
	"$util_dir/m" --stable
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="$3"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	# lib/m respects M_PREFIX to determine where to install.
	# Setting it to $install_path causes m to place binaries at:
	#   $install_path/m/versions/<version>/bin/   (versioned copy)
	#   $install_path/bin/                        (symlinks, on PATH via asdf)
	# M_CONFIRM=0 disables the interactive download confirmation prompt.
	M_PREFIX="$install_path" M_CONFIRM=0 "$util_dir/m" "$version" ||
		fail "An error occurred while installing $TOOL_NAME $version."

	local tool_cmd
	tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
	test -x "$install_path/bin/$tool_cmd" ||
		fail "Expected $install_path/bin/$tool_cmd to be executable."

	echo "$TOOL_NAME $version installation was successful!"
}
