import Foundation

protocol CountdownDelegate: class {
    func timeRemainingIs(_ seconds: TimeInterval)
}

class Countdown {
    weak var delegate: CountdownDelegate?
}

