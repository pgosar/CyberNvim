#!/usr/bin/env python3

import os
from PyPDF2 import PdfFileMerger

pdfs = [pdf for pdf in os.listdir() if pdf.endswith(".pdf")]
merger = PdfFileMerger()
print("pdf name: ")
filename = input()

for pdf in pdfs:
    merger.append(open(pdf, "rb"))

with open(filename + ".pdf", "wb") as fout:
    merger.write(fout)
