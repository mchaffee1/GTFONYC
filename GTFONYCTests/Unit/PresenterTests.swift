import Foundation
import Quick
import Nimble

@testable import GTFONYC

class PresenterTests: QuickSpec {
    override func spec() {
        var presenter: Presenter!
        var mockRecipient: MockCountdownTextRecipient!
        
        beforeEach {
            mockRecipient = MockCountdownTextRecipient()
            presenter = Presenter()
            presenter.registerCountdownTextRecipient(mockRecipient)
        }

        it("immediately updates recipients upon registration") {
            let mockRecipient = MockCountdownTextRecipient()
            presenter = Presenter()
            presenter.registerCountdownTextRecipient(mockRecipient)

            expect(mockRecipient.countdownTextSetCount) == 1
        }

        it("receives a sub-minute time interval from a Countdown and pushes a string to the viewController") {
            presenter.timeRemainingIs(56.789)

            expect(mockRecipient.countdownText) == "56s"
        }

        it("receives a multi-minute time interval from a Countdown and pushes a string to the viewController") {
            presenter.timeRemainingIs(123.456)

            expect(mockRecipient.countdownText) == "2m3s"
        }

        it("receives a multi-hour time interval from a Countdown and pushes a string to the viewController") {
            presenter.timeRemainingIs(8765.4322)

            expect(mockRecipient.countdownText) == "2h26m5s"
        }

        it("receives a negative value from a Countdown and pushes the 'time's up' string") {
            presenter.timeRemainingIs(-123.45)

            expect(mockRecipient.countdownText) == Presenter.TIMES_UP_TEXT
        }
    }
}
