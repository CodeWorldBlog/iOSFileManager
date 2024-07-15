//
//  LazyAtomic.swift
//  iOSFileManager
//


import Foundation

@propertyWrapper
struct AtomicPropertyWrapper<Value> {
    private let lock: NSLock = .init()
    private var value: Value
    var wrappedValue: Value {
        get { return getValueAtomicity() }
        set { setValueAtomicity(newValue: newValue) }
    }
    
    init(wrappedValue value: Value) {
        self.value = value
    }
    
    fileprivate func getValueAtomicity() -> Value {
        lock.lock()
        defer { lock.unlock() }
        return value
    }
    
    fileprivate mutating func setValueAtomicity(newValue: Value) {
        lock.lock()
        defer { lock.unlock() }
        value = newValue
    }
}
