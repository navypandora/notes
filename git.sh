git init
git add <filename>
git status (can be used to see what files are in staging area i.e. not committed yet)
git doesn't' add empty directories to the staging area (to solve this add a .keep file in the directory)
git rm --cached <filename> (remove the file from the index but not from the working directory)
git commit -a -m "message" <filename> (add and commit file)

add patterns(*.tmp. build/*) to .gitignore file, to ignore those files to be tracked 
git check-ignore *.tmp (to check what files are being ignored)

git tag -a v0.1 -m "message"
git tag (view all tags in the repo)
git show v0.1 (view tag details)
git tag -f v0.1 (delete tag)

git branch dev (create a new branch)
git checkout dev
git merge dev (merges dev to master branch)
git branch -d dev (delete branch)


git diff <commit> <commit> 

git config gc.pruneexpire "30 days" (will run every 30 days to delete files older than 2 weeks)