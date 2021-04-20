#!/bin/dash

# the seventh script for checking the 'git-commit -a -m'
# create a b c, add them into the index, commit the change
# remove the c and update a b, commit the change, it should be a new commit, c should also not in the index
./girt-init >/dev/null
touch a b c
echo "update a" >>a
echo "update b" >>b
./girt-add a b c
./girt-commit -m 'commit a b c' > /dev/null
rm c
echo "update a again">>a
echo "update b again">>b
output=$(./girt-commit -a -m "update file inside index")

# if the commit record is 1 and c is not in the index dir, then the operation is right
indexdir=$(pwd)"/.girt/index"
flag=0
if test "$output" = "Committed as commit 1"
then
    filec=$indexdir"/c"
    if ! test -f $filec
    then
        flag=1
        echo "girt-commit -a -m operation is right"
    fi
fi

if test $flag -eq 0
then
    echo "girt-commit -a -m operation is wrong"
fi

rm -r ".girt"
rm a b

