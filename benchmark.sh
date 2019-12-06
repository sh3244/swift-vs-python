#!/bin/bash

printf "\nRunning Swift Benchmark..."
printf "Swift Output:\n$( time ./swift.sh )\n"

printf "\n================================"

printf "\nRunning Python Benchmark..."
printf "Python Output:\n$( time ./python.sh )\n"