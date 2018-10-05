import Foundation
import Quick
import Nimble

@testable import GTFONYC

class TimeInterval_ExtTests: QuickSpec {
    override func spec() {
        it("returns integer seconds") {
            let testValue: TimeInterval = 23.6667

            expect(testValue.seconds) == 23
        }

        it("returns integer seconds modulo 60") {
            let testValue: TimeInterval = 123.6667

            expect(testValue.seconds) == 3
        }

        it("returns integer minutes") {
            let testValue: TimeInterval = 123.3

            expect(testValue.minutes) == 2
        }

        it("returns integer hours") {
            let testValue: TimeInterval = 8765.4322

            expect(testValue.hours) == 2
            expect(testValue.minutes) == 26
            expect(testValue.seconds) == 5
        }
    }
}
