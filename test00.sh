#!/bin/dash

# the first testscript that i created for testing the 'girt-init'


testresult=$(./girt-init)
# if the '.girt' is not there
if ! test -d ".girt"
then
    if test "$testresult" != "Initialized empty girt repository in .girt"
    then
        echo "girt-init operation is wrong"
        echo "expect output: Initialized empty girt repository in .girt"
        echo "your output: $testresult"
        rm -r ".girt"
        exit 1
    else
        echo "girt-init operation is right"
        rm -r ".girt"
        exit 0
    fi
# if the '.girt' is already there
else
    if test "$testresult" != "girt-init: error: .girt already exists"
    then
        echo "girt-init operation is wrong"
        echo "expect output: girt-init: error: .girt already exists"
        echo "your output: $testresult"
        rm -r ".girt"
        exit 1
    else
        echo "girt-init operation is right"
        rm -r ".girt"
        exit 0
    fi
fi

