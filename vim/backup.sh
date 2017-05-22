rm -rf backup
mkdir backup
cp ~/.vimrc backup
cp -rf ~/.vim backup
cp ~/.viminfo backup
tar -cf backup.tar backup
rm -rf backup
