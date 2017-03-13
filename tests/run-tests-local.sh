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
    run-tests 2.0.5 1.6.8 #Insert more Sparkling Water versions here. Currently set to latest for Spark 2.0 and 1.6.
else
    run-tests "$@"
fi
