#!/usr/bin/swift

import Foundation

class FastThread: Thread {
	let increment = 1

    init(_ array: inout [Int], index: Int, increments: Int) {
        for _ in 0..<increments { array[index] += increment }
    }
}

var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

_ = (0..<array.count).compactMap { FastThread(&array, index: $0, increments: 10000000).start() }

print(array)