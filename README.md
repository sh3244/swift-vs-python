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

### 1 Million increments each array item, Python takes too long for more, and Java doesn't support integers larger than that.

```
sam$ ./benchmark.sh 

Running Swift Benchmark...
real	0m0.321s
user	0m0.262s
sys	0m0.053s
Swift Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running Swift Multithreaded Benchmark...
real	0m0.706s
user	0m0.506s
sys	0m0.192s
Swift Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running Java Benchmark...
real	0m0.665s
user	0m1.301s
sys	0m0.102s
Java Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running Python Benchmark...
real	0m1.459s
user	0m1.433s
sys	0m0.021s
Python Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]

================================
Running C++ Benchmark...
real	0m0.545s
user	0m0.451s
sys	0m0.054s
C++ Output:
[1000001, 1000002, 1000003, 1000004, 1000005, 1000006, 1000007, 1000008, 1000009, 1000000]
```
