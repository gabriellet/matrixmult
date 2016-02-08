#!/bin/bash

perfLog=$1'-perf.txt'

echo "perf tests for $@" > $perfLog
echo "****************************" >> $perfLog

perf stat -o $perfLog --append --repeat=10 -e cycles -e instructions -e cpu-clock -e faults -e cs $@ 10
perf stat -o $perfLog --append --repeat=10 -e cycles -e instructions -e cpu-clock -e faults -e cs $@ 100
perf stat -o $perfLog --append --repeat=10 -e cycles -e instructions -e cpu-clock -e faults -e cs $@ 1000
