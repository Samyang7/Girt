#!/bin/dash

# the sixth script for checking the 'git-show'
# create the file 'a', add to the index, commit the change
# modify the file 'a', add to the index, commit the change
# modify the file 'a', do './girt-show 0:a', './girt-show 1:a', './girt-show :a'

./girt-init >/dev/null
files="a"
touch $files
echo "line" >>a
./girt-add $files
./girt-commit -m "commit a" >/dev/null
echo "add a new line" >>a
./girt-add $files
./girt-commit -m "add a new line to a" >/dev/null
echo "add another new line" >>a
./girt-add $files 

# check the ./girt-show 0:a
firstresult=$(./girt-show 0:a)
if test $firstresult != "line"
then
    echo "girt-show operation is wrong"
fi

# check the ./girt-show 1:a, save the expect result into "testfile", actual result tp "resultfile"
touch "testfile"
echo "line" >> "testfile"
echo "add a new line" >> "testfile"

touch "resultfile"
./girt-show 1:a >> "resultfile"
if ! diff "resultfile" "testfile" >/dev/null
then
    echo "girt-show operation is wrong"
fi
rm "testfile" "resultfile"

# check the ./girt=show :a, save the expect result into "testfile", actual result tp "resultfile"
touch "testfile"
echo "line" >> "testfile"
echo "add a new line" >> "testfile"
echo "add another new line" >> "testfile"

touch "resultfile"
./girt-show :a >> "resultfile"
if ! diff "resultfile" "testfile" >/dev/null
then
    echo "girt-show operation is wrong"
fi
rm "testfile" "resultfile"

echo "girt-show operation is right"

rm -r ".girt"
rm a
