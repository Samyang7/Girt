#!/bin/dash

# the eighth script for checking the 'git-rm --force a'(small edge case for --force)
# create the file 'a', rm file with --force flag, the expect output should be:
# it would not allow 'a' to be removed even there is a --force flag because a is not in the index

./girt-init >/dev/null
touch a

# store the actual result into the resultfile by redirecting stream 1 to the file
touch "resultfile"
./girt-rm --force a 1> "resultfile"

# store the expect result into the testfile
touch "testfile"
echo "girt-rm: error: 'a' is not in the girt repository" >> "testfile"

if ! diff "testfile" "resultfile" > /dev/null
then
    echo "girt-rm --force operation is wrong"
else
    echo "girt-rm --force operation is right"
fi
rm "testfile" "resultfile"

rm -r ".girt"
rm a


