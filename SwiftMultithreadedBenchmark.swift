#!/usr/bin/swift

import Foundation

class FastThread: Thread {
    init(_ array: inout [Int], index: Int, increments: Int) {
    	var value = array[index]

        for _ in 0..<increments { value += 1 }

        array[index] = value
    }
}

var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

_ = (0..<array.count).compactMap { FastThread(&array, index: $0, increments: 10000000000).start() }

print(array)