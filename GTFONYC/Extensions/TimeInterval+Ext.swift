import Foundation

extension TimeInterval {
    fileprivate typealias Class = TimeInterval
    static let SECONDS_PER_MINUTE = 60
    static let MINUTES_PER_HOUR = 60
    static let SECONDS_PER_HOUR = Class.SECONDS_PER_MINUTE * Class.MINUTES_PER_HOUR

    var seconds: Int { return Int(self) }
    var minutes: Int { return seconds / Class.SECONDS_PER_MINUTE }

    var secondsPlace: Int {
        return seconds % Class.SECONDS_PER_MINUTE
    }

    var minutesPlace: Int {
        return minutes % Class.MINUTES_PER_HOUR
    }

    var hours: Int {
        return Int(self) / Class.SECONDS_PER_HOUR
    }
}
