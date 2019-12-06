#!/usr/bin/swift

var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

for _ in 0..<10000000 {
    for i in 0..<array.count {
        array[i] += 1
    }
}

print(array)