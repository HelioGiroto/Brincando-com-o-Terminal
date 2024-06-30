# FIND


Move Files From Subfolders To Parent Folder
Command:

find . -mindepth 2 -type f -exec mv "{}" . \;
Description: Moves files from subfolders to parent (current) folder.
Requires:

find . -mindepth 2 -type f -exec mv "{}" . \;
Delete All Empty Folders
Command:

find . -type d -empty -delete
Description: Deletes all empty folders in current directory.
Requires:

find . -type d -empty -delete



