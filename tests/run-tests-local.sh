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
    run-tests 2.2.11 2.1.25 2.0.26 1.6.13 #Insert more Sparkling Water versions here.
else
    run-tests "$@"
fi
