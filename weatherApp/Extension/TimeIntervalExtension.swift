

import Foundation

extension TimeInterval {
    var minuteSecondFormat: String {
        return String(format:"%d:%02ds", minute, second)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
}

extension Int {
    var msToSec: Double {
        return Double(self) / 1000
    }
}
