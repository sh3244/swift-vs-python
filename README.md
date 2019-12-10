# swift-vs-python

Non-scientific, somewhat real-world benchmark to evaluate **Swift** vs **Python** performance. **Now expanding to include more common programming languages**

Standard test configuration: 
  Using the same language-specific syntax/flow control...Increment an array of 10 **integers** 10 million times each.

# How to use

Run **benchmark.sh** to run the benchmarks.

# Preliminary Results

Swift's compiler seems to optimize this iterative increment operation somehow, resulting in a near constant time to run this benchmark.

Meanwhile, Python is unable to finish in a reasonable amount of time...

# Example Results

### 10 Million increments each array item, Python takes too long for more, and Java doesn't support integers larger than that.

```
sam$ ./benchmark.sh 

Running Swift Benchmark...
real	0m0.485s
user	0m0.429s
sys	0m0.046s
Swift Output:
[10000001, 10000002, 10000003, 10000004, 10000005, 10000006, 10000007, 10000008, 10000009, 10000000]

================================
Running Swift Multithreaded Benchmark...
real	0m0.897s
user	0m0.695s
sys	0m0.189s
Swift Output:
[10000001, 10000002, 10000003, 10000004, 10000005, 10000006, 10000007, 10000008, 10000009, 10000000]

================================
Running Java Benchmark...
real	0m0.725s
user	0m1.351s
sys	0m0.106s
Java Output:
[10000001, 10000002, 10000003, 10000004, 10000005, 10000006, 10000007, 10000008, 10000009, 10000000]

================================
Running Python Benchmark...
real	0m14.475s
user	0m14.427s
sys	0m0.034s
Python Output:
[10000001, 10000002, 10000003, 10000004, 10000005, 10000006, 10000007, 10000008, 10000009, 10000000]

================================
Running C++ Benchmark...
real	0m0.930s
user	0m0.743s
sys	0m0.066s
C++ Output:
[10000001, 10000002, 10000003, 10000004, 10000005, 10000006, 10000007, 10000008, 10000009, 10000000]
```
