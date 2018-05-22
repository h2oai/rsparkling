#!/usr/bin/env bash

#Run rsparkling unit tests locally
run-tests () {
    while [ "$#" -ne "0" ]; do
	export SPARKLINGWATER_VERSION="$1"
	echo "==> Running tests with Sparkling Water Version ${SPARKLINGWATER_VERSION} ..."
	R -f testthat.R
	shift
    done
}

export NOT_CRAN="true"
if [ "$#" -eq "0" ]; then
    run-tests 2.3.4 2.2.15 2.1.29 #Insert more Sparkling Water versions here.
else
    run-tests "$@"
fi
