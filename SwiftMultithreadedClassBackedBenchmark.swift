#!/usr/bin/swift

import Foundation

class ConcurrentOperation: Operation {
    @objc private enum OperationState: Int {
        case ready
        case executing
        case finished
    }

    /// Concurrent queue for synchronizing access to `state`.
    private let stateQueue = DispatchQueue(label: Bundle.main.bundleIdentifier! + ".rw.state", attributes: .concurrent)

    /// Private backing stored property for `state`.
    private var rawState: OperationState = .ready

    /// The state of the operation
    @objc private dynamic var state: OperationState {
        get { return stateQueue.sync { rawState } }
        set { stateQueue.sync(flags: .barrier) { rawState = newValue } }
    }

    // MARK: - Various `Operation` properties

    open override var isReady: Bool {
        return state == .ready && super.isReady
    }
    public final override var isExecuting: Bool {
        return state == .executing
    }
    public final override var isFinished: Bool {
        return state == .finished
    }
    //    public final override var isAsynchronous: Bool { return true } // Does not need to be set when using operation queues

    // MARK: - KVN for dependent properties

    @objc private dynamic class func keyPathsForValuesAffectingIsReady() -> Set<String> {
        return [#keyPath(state)]
    }

    @objc private dynamic class func keyPathsForValuesAffectingIsExecuting() -> Set<String> {
        return [#keyPath(state)]
    }

    @objc private dynamic class func keyPathsForValuesAffectingIsFinished() -> Set<String> {
        return [#keyPath(state)]
    }

    // MARK: - Foundation.Operation

    public final override func start() {
        if isCancelled {
            finish()
            return
        }

        state = .executing
        main()
    }

    // MARK: - Public

    /// Subclasses must implement this to perform their work and they must not call `super`. The default implementation of this function throws an exception.
    open override func main() {
        fatalError("Subclasses must implement `main`.")
    }

    /// Call this function to finish an operation that is currently executing
    public final func finish() {
        if isExecuting { state = .finished }
    }
}

class IncrementOperation: ConcurrentOperation {
    var index: Int = 0
    var array: [Int] = []

    init(_ array: inout [Int], index: Int) {
        self.array = array
    }

    override func main() {
        array[index] += 1
        self.finish()
    }

    override func isEqual(_ object: Any?) -> Bool {
        return false
    }
}

class PrintOperation: ConcurrentOperation {
    var array: [Int] = []

    init(_ array: inout [Int]) {
        self.array = array
    }

    override func main() {
        print(array)
        self.finish()
    }

    override func isEqual(_ object: Any?) -> Bool {
        return false
    }
}

class Operations {
    static let shared = Operations()

    // Capped concurrency queue
    lazy var operationsQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = .userInitiated
        queue.maxConcurrentOperationCount = 100
        return queue
    }()
}

var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

for j in 0..<100000000 {
    for i in 0..<array.count - 1 {
        Operations.shared.operationsQueue.addOperation(IncrementOperation(&array, index: i))
    }
    let lastIncrementOperation = IncrementOperation(&array, index: array.count - 1)
    if j == 99 {
        Operations.shared.operationsQueue.addOperation(lastIncrementOperation)
        let printOperation = PrintOperation(&array)
        printOperation.addDependency(lastIncrementOperation)
        Operations.shared.operationsQueue.addOperation(printOperation)
    } else {
        Operations.shared.operationsQueue.addOperation(lastIncrementOperation)
    }
}