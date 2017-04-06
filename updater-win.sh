#!/bin/bash

GMOD_DIR=gmodds
INSTALL=false
UPDATE=false
UPDATE_SCRIPT=""

usage() {
    echo "
Usage: ./updater-win.sh [-i|-u [-f FILENAME]]

    -i            - Install
    -u            - Update
    -f [filename] - Update script to run with"

    exit 0
}

run_install() {
    if ! [[ ${UPDATE_SCRIPT} == "" ]] ; then
        cd steam
        ./steamcmd.exe +runscript ${UPDATE_SCRIPT}
        cd ..
    else
        cd steam
        ./steamcmd.exe +runscript ../update_script.txt
        cd ..
    fi
}

while getopts ":iuf:h" arg ; do
    case "${arg}" in
        i)
            INSTALL=true
            ;;
        u)
            UPDATE=true
            ;;
        f)
            UPDATE_SCRIPT=${OPTARG}
            ;;
        h)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if ${INSTALL} ; then
    if ${UPDATE} ; then
        echo "You cannot pass -u with -i!"
        # exit 1
    else
        if ! [ -d "${GMOD_DIR}" ] ; then
            mkdir ${GMOD_DIR}
            run_install
        else
            echo "The server is already installed! Run with -u to update"
            exit 1
        fi
    fi
fi

if ${UPDATE} ; then
    if ${INSTALL} ; then
        echo "You cannot pass -i with -u!"
        exit 1
    else
        if [ -d "${GMOD_DIR}" ] ; then
            run_install
        else
            echo "You do not have the server installed! Run with -i to install"
            exit 1
        fi
    fi
fi

unset INSTALL
unset UPDATE
unset UPDATE_SCRIPT
unset GMOD_DIR

exit 0
