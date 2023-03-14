swww init
while true;
do
  ls -d ~/Pictures/Wallpaper/* | sort -R | while read file;
  do
    swww img "$file" --transition-step 16 --transition-fps 30 --transition-type random
    sleep 300
  done
done
