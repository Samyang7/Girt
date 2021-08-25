# Description
Implementing a subset of the version control system Git. Git is a complex program that has many individual commands. Girt implements only a few of the most important command. Girt is a contraction of git restricted subset. Implemented girt command behaved the same as the git command.

# Girt Commands
## girt-init
girt-init command create an empty girt repository. girt-init create a directory named .girt, which it will use to store the repository. It produce an error message if this directory already exists.

## girt-add filenames ...
The girt-add command adds the contents of one or more files to the index. Files are added to the repository in a two step process. The first step is adding them to the index. Files are stored in the index in a sub-directory inside .girt. Only ordinary files in the current directory can be added. 

## girt-commit -m message
The girt-commit command saves a copy of all files in the index to the repository.

## girt-log 
The girt-log command prints a line for every commit made to the repository: each line contain the commit number, and the commit message.

## girt-show [commit]:filename
The girt-show print the contents of the specified filename as of the specified commit. If commit is omitted, the contents of the file in the index will be printed.

## girt-commit [-a] -m message
girt-commit have a -a option, which causes all files already in the index to have their contents from the current directory added to the index before the commit.

## girt-rm [--force] [--cached] filenames
