import Foundation

protocol CountdownDelegate: class {
    func timeRemainingIs(_ seconds: TimeInterval)
}

class Countdown {
    fileprivate typealias Class = Countdown

    private static let tickInterval: TimeInterval = 0.1

    private let target = DateComponents(calendar: NSCalendar.current, timeZone: TimeZone(abbreviation: "EDT"), era: nil, year: 2018, month: 10, day: 7, hour: 18, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil).date
    weak var delegate: CountdownDelegate?
    var timer: Timer?

    init(delegate: CountdownDelegate) {
        print("init!")
        self.delegate = delegate
        start()
    }

    private func start() {
        print("start!")
        timer = Timer.scheduledTimer(withTimeInterval: Class.tickInterval, repeats: true) { _ in
            print("tick!")
            self.tick()
        }
    }

    private func tick() {
        guard let target = target else { return }
        delegate?.timeRemainingIs(-1 * Date().timeIntervalSince(target))
    }
}
