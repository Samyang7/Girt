#!/bin/dash

# the forth testscript for checking the 'git-commit'
# create the a b c d file, add to the index, commit the change
# delete the file a, add to the index, commit the change again

./girt-init > /dev/null
files="a b c d"
touch $files
./girt-add $files
firstCommitOutput=$(./girt-commit -m 'add files a b c d')

rm a
./girt-add a
secondCommitOutput=$(./girt-commit -m 'delete files a')

# because after the a remove, if we add 'a' agagin, 'a' should be removed from index
# if we then commit the change, the latest commit history would not have 'a' record since it was removed
# it is a new commit comparing with the old one, so it should be 'committed a commit 1'
if test "$secondCommitOutput" != "Committed as commit 1"
then
    echo "girt-commit operation is wrong"
else
    echo "girt-commit operation is right"
fi

rm -r ".girt"
rm b c d