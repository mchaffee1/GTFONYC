import Foundation

@testable import GTFONYC

class MockCountdownTextRecipient: CountdownTextRecipient {
    var countdownTextSetCount = 0
    var countdownTextValues: [String] = []
    var countdownText: String {
        get { return countdownTextValues.last ?? "" }
        set {
            countdownTextValues.append(newValue)
            countdownTextSetCount += 1
        }
    }
}
