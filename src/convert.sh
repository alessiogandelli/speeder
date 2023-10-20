#!/bin/bash

# Input file # get as a parameter
input_file=$1
bitrate=$2
resolution=$3



output_file="${input_file%.*}_${bitrate}_${resolution}.mp4"

# Conversion command
ffmpeg -i "$input_file" -b:v "$bitrate" -s "$resolution" -vcodec h264 -acodec aac "$output_file"

