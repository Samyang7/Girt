#!/bin/dash

# the tenth script for checking the 'girt-status'
# create file a b c d e
# add the file a b c d into index, commit the change 
# modify file a b c d, add a b d into index
# modify the file a d again, rm c, rm d

./girt-init >/dev/null

touch a b c d e
./girt-add a b c d
./girt-commit -m "commit change" >/dev/null
echo "update a" >> a
echo "update b" >> b
echo "update c" >> c
echo "update d" >> d
./girt-add a b d
echo "update a again" >> a
echo "update d again" >> d
rm c
rm d

touch "resultfile"
./girt-status > "resultfile"
cat "resultfile"

touch "testfile"
echo "a - file changed, different changes staged for commit" >> "testfile"
echo "b - file changed, changes staged for commit" >> "testfile"
echo "c - file deleted" >> "testfile"
echo "d - file deleted, different changes staged for commit" >> "testfile"
echo "diary.txt - untracked" >> "testfile"
echo "e - untracked" >> "testfile"
echo "girt-add - untracked" >> "testfile"
echo "girt-commit - untracked" >> "testfile"
echo "girt-init - untracked" >> "testfile"
echo "girt-log - untracked" >> "testfile"
echo "girt-rm - untracked" >> "testfile"
echo "girt-show - untracked" >> "testfile"
echo "girt-status - untracked" >> "testfile"
echo "resultfile - untracked" >> "testfile"
echo "test00.sh - untracked" >> "testfile"
echo "test01.sh - untracked" >> "testfile"
echo "test02.sh - untracked" >> "testfile"
echo "test03.sh - untracked" >> "testfile"
echo "test04.sh - untracked" >> "testfile"
echo "test05.sh - untracked" >> "testfile"
echo "test06.sh - untracked" >> "testfile"
echo "test07.sh - untracked" >> "testfile"
echo "test08.sh - untracked" >> "testfile"
echo "test09.sh - untracked" >> "testfile"


rm "resultfile" 
rm -r ".girt"
rm a b e


