#!/bin/bash

# Input file
input_file=$1

len=$2

# Get the duration of the video in seconds
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$input_file")
duration=${duration%.*}  # Remove the decimal part

# Calculate the speed factor
speed_factor=$(bc <<< "scale=2; $duration / ($len * 60)")

# Create output file name
output_file="${input_file%.*}_x${speed_factor}.mp4"

# Speed up the video
ffmpeg -i "$input_file" -vf "setpts=PTS/$speed_factor" -an "$output_file"

echo "$speed_factor"