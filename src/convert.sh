#!/bin/bash

# Input file # get as a parameter
input_file=$1

# Array of bitrates
bitrates=("0.1M" "1M" "10M")

# Array of resolutions
resolutions=("320x240" "480x360" "640x480" "800x600"  "3840x2160")

# Loop over bitrates
for bitrate in "${bitrates[@]}"; do
  # Loop over resolutions
  for resolution in "${resolutions[@]}"; do
    # Create output file name
    output_file="${input_file%.*}_${bitrate}_${resolution}.mp4"
    
    # Conversion command
    ffmpeg -i "$input_file" -b:v "$bitrate" -s "$resolution" -vcodec h264 -acodec aac "$output_file"
  done
done

