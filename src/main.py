#%%
import pandas as pd 
from utils import get_random_string
from dotenv import load_dotenv
import os
load_dotenv()
from moviepy.editor import VideoFileClip, concatenate_videoclips, TextClip

data_path = os.getenv("DATA_PATH")

# Load the videos
clip1 = VideoFileClip(data_path + "cubo.mov")

# converto to mp4
clip1.write_videofile(data_path + "cubo.mp4")



# speed it up to have it 1 minute long
clip1 = clip1.speedx(factor=2.0)


# %%
# speed up the video
