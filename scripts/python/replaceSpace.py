#!/usr/bin/env python3

import os

dir = os.getcwd()
for file in os.listdir(dir):
    path = os.path.join(dir, file)
    os.rename(path, path.replace(" ", "_").lower())
