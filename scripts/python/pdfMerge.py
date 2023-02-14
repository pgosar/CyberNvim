#!/usr/bin/env python3

import os
from PyPDF2 import PdfMerger

pdfs = [pdf for pdf in os.listdir() if pdf.endswith(".pdf")]
merger = PdfMerger()
print("pdf name: ")
filename = input()

for pdf in pdfs:
    merger.append(pdf)

merger.write(filename)
merger.close()
