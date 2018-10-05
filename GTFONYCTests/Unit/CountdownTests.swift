import Foundation
import Quick
import Nimble

@testable import GTFONYC

class CountdownTests: QuickSpec {
    override func spec() {
        xit("emits once-a-second ticks once instantiated") {
            let mockDelegate = MockCountdownDelegate()
            var countdown: Countdown?
            DispatchQueue.global(qos: .userInitiated).async {
                countdown = Countdown(delegate: mockDelegate)
            }

            Thread.sleep(forTimeInterval: 1.1)

            expect(mockDelegate.timeRemainingIsCallCount) == 1
            expect(countdown) != nil
            //.to(equal(1), timeout: 5.0, pollInterval: 0.5, description: "timeRemainingIsCallCount")
        }
    }
}

