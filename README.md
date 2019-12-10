# swift-vs-python

Non-scientific, somewhat real-world benchmark to evaluate **Swift** vs **Python** performance. **Now expanding to include more common programming languages**

Standard test configuration: 
  Using the same language-specific syntax/flow control...Increment an array of 10 **integers** 10 million times each.

# How to use

Run **benchmark.sh** to run the benchmarks.

# Preliminary Results

Swift's compiler seems to optimize this iterative increment operation somehow, resulting in a near constant time to run this benchmark.

Meanwhile, Python is unable to finish in a reasonable amount of time...

# Example Results (1 Million increments each array item, python takes too long for more, and java doesn't support integers that large.)

```
Local-Computer:swift-vs-python sam$ ./benchmark.sh 

Running Swift Benchmark...
real	0m0.320s
user	0m0.267s
sys	0m0.045s
Swift Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running Swift Multithreaded Benchmark...
real	0m0.867s
user	0m0.539s
sys	0m0.266s
Swift Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running Java Benchmark...
real	0m0.651s
user	0m1.120s
sys	0m0.085s
Java Output:
Hello, World
1000001

================================
Running Python Benchmark...
real	0m1.510s
user	0m1.478s
sys	0m0.024s
Python Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running C++ Benchmark...
real	0m0.645s
user	0m0.480s
sys	0m0.058s
C++ Output:
1000001 1000002 1000003 1000004 1000005 1000006 1000007 1000008 1000009 1000000
```
