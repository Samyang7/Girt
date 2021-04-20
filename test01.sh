#!/bin/dash

# the second testscript for checking the 'girt-add'

# check the 'girt-init'
# create the a b c d file, add to the index, check files are in index dir
./girt-init > /dev/null
files="a b c d"
touch $files
./girt-add $files

# check if files are added to the index dir
flag=0
indexDir=$(pwd)"/.girt/index/"
for file in $files
do
    indexFile=$indexDir$file
    if ! test -f $indexFile
    then
        flag=1
        echo "girt-add operation is wrong"
        break;
    fi
done

if test $flag -eq 0
then
    echo "girt-add operation is right"
fi

rm -r ".girt"
rm $files




