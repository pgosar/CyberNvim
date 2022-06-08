#!/bin/sh
# runs the nbody simulation
/mnt/c/"Program Files (x86)"/"Microsoft Visual Studio"/2022/BuildTools/MSBuild/Current/Bin/MSBuild.exe ./n-body-simulation.sln

./x64/Debug/n-body-simulation.exe
