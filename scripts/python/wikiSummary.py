#!/usr/bin/env python3

import sys
import wikipedia
try:
    print(wikipedia.summary(sys.argv, sentences=5))
except wikipedia.DisambiguationError as e:
    print("Disambiguation Error. Try a different option.\nOptions:")
    for option in e.options:
        print(option)
