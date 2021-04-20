#!/bin/dash

# the fifth script for checking the 'git-log'
# create the file 'a', add to the index, commit the change
# modify the file 'a', add to the index, commit the change

./girt-init >/dev/null
files="a"
touch $files
./girt-add $files
./girt-commit -m "commit a" >/dev/null
echo "add a new line" >>a
./girt-add $files
./girt-commit -m "add a new line to a" >/dev/null
echo "add another new line" >>a

# check the ./girt-log output direcly from head -1 and tail -1
# there is a better way just store the expect output into one file and actual output into another file and use diff to compare them
# which is what i did for test05.sh
firstline=$(./girt-log |head -1)
secondline=$(./girt-log|tail -1)
if test "$firstline" != "1 add a new line to a" -o "$secondline" != "0 commit a"
then
    echo "girt-log operation is wrong"
else
    echo "girt-log operation is right"
fi

rm -r ".girt"
rm a




