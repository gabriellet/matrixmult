#!/bin/bash

perfLog=$1'-perf.txt'
echo >> $perfLog
echo "****************************" >> $perfLog
echo "perf tests for $@" > $perfLog
echo "****************************" >> $perfLog

perf stat -o $perfLog --append --repeat=10 $@ 10
perf stat -o $perfLog --append --repeat=10 $@ 100
perf stat -o $perfLog --append --repeat=10 $@ 1000
