# swift-vs-python

Non-scientific, somewhat real-world benchmark to test **Swift** vs **Python** performance.

Standard test configuration: 
  Using the same language-specific syntax/flow control...Increment an array of 10 **integers** 100 million times each.

# How to use

Run **benchmark.sh** to run the benchmarks.

# Preliminary Results

Swift's compiler seems to optimize this iterative increment operation somehow, resulting in a near constant time to run this benchmark.

Meanwhile, Python is unable to finish in a reasonable amount of time...
