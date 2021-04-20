#!/bin/dash

# the ninth script for checking the 'girt-rm --cached a'
# create file 'a', add to the index, commit the change
# add a new line to 'a' and add to the index. then add another new line to 'a'
# if a do girt-rm --cached a, it should display
# girt-rm: error: 'a' in index is different to both to the working file and the repository

./girt-init >/dev/null
touch a
./girt-add a
./girt-commit -m "commit a" >/dev/null
echo sam >>a
./girt-add a
echo sam >>a

# store the actual result into the resultfile by redirecting stream 1 to the file
touch "resultfile"
./girt-rm --cached a 1> "resultfile"

# store the expect result into the testfile
touch "testfile"
echo "girt-rm: error: 'a' in index is different to both to the working file and the repository" >> "testfile"

if ! diff "testfile" "resultfile" > /dev/null
then
    echo "girt-rm --cached operation is wrong"
else
    echo "girt-rm --cached operation is right"
fi
rm "testfile" "resultfile"

rm -r ".girt"
rm a
