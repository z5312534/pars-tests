#!/bin/bash

function build_pars() {
	if type 6991 >/dev/null 2>&1; then
		6991 cargo build
	else
		cargo build
	fi
}

if [ -z "$pars" ]; then
	if [ -z "$parsdir" ]; then
		parsdir='pars'

		if [ ! -d "$parsdir" ]; then
			parsdir='../pars'
		fi

		if [ ! -d "$parsdir" ]; then
			echo "could not find pars directory"
			exit 1
		fi
	fi

	(cd "$parsdir" && build_pars)
	pars="$parsdir/target/debug/pars"

	if [ ! -x "$pars" ]; then
		echo "could not find pars binary"
		exit 1
	fi
fi

testdir="$(dirname -- "$0")/tests"

for subdir in "$testdir"/*; do
	for infile in "$subdir"/*.sh; do
		pars="$pars" bash "$infile"
	done
done
