import Foundation

@testable import GTFONYC

class MockCountdownDelegate: CountdownDelegate {
    var timeRemainingIsCallCount = 0
    var timeRemainingIsValues: [TimeInterval] = []
    func timeRemainingIs(_ seconds: TimeInterval) {
        timeRemainingIsCallCount += 1
        timeRemainingIsValues.append(seconds)
    }
}
