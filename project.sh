# Project will execute and demonstrate some file expressions
# This will happen at 12:30am on Sundays via a crontab schedule
#Code Begins Here:

search_dir="$HOME"

#Date
current_date=$(date '+%m.%d.%Y')
current_times=$(date '+%H:%M:%S')
timezone=$(date '+%Z')
timestamp="$current_date $current_time $timezone"

#Log File Naming Convention
log_file="$HOME/cs340/logFiles/log_$timestamp.txt"

#find to search for files and print their types
find "$search_dir" -type f-o -iname '•*' | while read -r file; do
  #get the file extension
  extension="${file##*.｝"
  case "$extension" in
    exe) echo "$file: Executable File" ;;
    sh) echo "$file: Shell Script" ;;
    sys) echo "$file: System File" ;;
    *) echo "$file: Regular File" ;;
  esc
done > "$log_file"
echo "Saved to $log_file"
