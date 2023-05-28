#!/bin/bash

#Runpod setup directions here: https://www.youtube.com/watch?v=TP2yID7Ubr4
#You MUST set container image to runpod/oobabooga:1.1.0
#Set Disk size to at least 50GB
#Always use a fresh pod.
#git clone this file by default to /text-generation-webui

git pull
pip install -r requirements.txt
 
mkdir repositories
cd repositories
git clone https://github.com/oobabooga/GPTQ-for-LLaMa.git -b cuda
cd GPTQ-for-LLaMa && python setup_cuda.py install
 
cd /text-generation-webui
 
pip install scipy
 
python server.py --share --chat --auto-devices --model llama
