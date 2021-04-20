#!/bin/dash

# the third testscript for checking the 'girt-add'
# create the a b c d file, add to the index, delete the a file, add a file back to index
# the a should not appear in the index dir

./girt-init > /dev/null
files="a b c d"
touch $files
./girt-add $files
rm a
./girt-add a

# check if files are added to the index dir
# the 'a' should be removed from the index, other files should be preserved from index
flag=0
indexDir=$(pwd)"/.girt/index/"
for file in $files
do
    indexFile=$indexDir$file
    if test $file = "a"
    then
        if test -f $indexFile
        then
            flag=1
            echo "girt-add operation is wrong"
            break;
        fi
    else
        if ! test -f $indexFile
        then
            flag=1
            echo "girt-add operation is wrong"
            break;
        fi
    fi
done

if test $flag -eq 0
then
    echo "girt-add operation is right"
fi

rm -r ".girt"
rm b c d