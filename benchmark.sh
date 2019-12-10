#!/bin/bash

# if [ "$0" != "" ]; then
#     echo "Positional parameter 0 contains something"
# else
#     echo "Positional parameter 0 is empty"
# fi

printf "\nRunning Swift Benchmark..."
printf "Swift Output:\n$( time ./swift.sh )\n"

printf "\n================================"

printf "\nRunning Swift Multithreaded Benchmark..."
printf "Swift Output:\n$( time ./swift_multithreaded.sh )\n"

printf "\n================================"

printf "\nRunning Java Benchmark..."
printf "Java Output:\n$( time ./java.sh )\n"

printf "\n================================"

printf "\nRunning Python Benchmark..."
printf "Python Output:\n$( time ./python.sh )\n"

printf "\n================================"

printf "\nRunning C++ Benchmark..."
printf "C++ Output:\n$( time ./cpp.sh )\n"