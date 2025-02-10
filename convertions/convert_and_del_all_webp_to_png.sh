#!/usr/bin/env sh

# Converts all webp inside the specified directory into png
arg_dir="$1"


for file in "$arg_dir"/*; do
    [ -f "$file" ] || continue  # Ensure it's a file

    filename="${file%.*}"
    extension="${file##*.}"

    if [[ "$extension" == "webp" ]]; then
        printf "Converting: $file\n"
        ffmpeg -y -i "$file" "${filename}.png" > /dev/null 2>&1
        [ -f "${filename}.png" ] || continue  # Ensure the conversion was successful
        rm "$file"
    fi
done
