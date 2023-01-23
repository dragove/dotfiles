swww init
while true;
do
  ls -d ~/Pictures/Wallpaper/* | sort -R | while read file;
  do
    swww img "$file"
    sleep 300
  done
done
