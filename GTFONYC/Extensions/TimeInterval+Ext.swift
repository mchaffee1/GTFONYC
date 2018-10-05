import Foundation

extension TimeInterval {
    fileprivate typealias Class = TimeInterval
    static let SECONDS_PER_MINUTE = 60
    static let SECONDS_PER_HOUR = 60 * 60

    var seconds: Int {
        return Int(self) % Class.SECONDS_PER_MINUTE
    }

    var minutes: Int {
        return (Int(self) % Class.SECONDS_PER_HOUR) / Class.SECONDS_PER_MINUTE
    }

    var hours: Int {
        return Int(self) / Class.SECONDS_PER_HOUR
    }
}
