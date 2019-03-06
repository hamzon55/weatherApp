

import Foundation


struct Persistent<T> {
    private let defaults = UserDefaults.standard
    private var key: String
    init(_ key: String) {
        self.key = key
    }
    var value: T {
        get {
            guard let value = defaults.value(forKey: key) as? T else {
                fatalError("Not value found for \(key) ")
            }
            return value
        }
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}
