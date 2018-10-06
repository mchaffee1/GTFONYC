import Foundation
import Quick
import Nimble

@testable import GTFONYC

class TimeInterval_ExtTests: QuickSpec {
    override func spec() {
        it("returns integer seconds") {
            let testValue: TimeInterval = 23.6667

            expect(testValue.secondsPlace) == 23
        }

        it("returns integer seconds modulo 60") {
            let testValue: TimeInterval = 123.6667

            expect(testValue.secondsPlace) == 3
        }

        it("returns integer minutes") {
            let testValue: TimeInterval = 123.3

            expect(testValue.minutesPlace) == 2
        }

        it("returns integer minutes modulo 60") {
            let testValue: TimeInterval = 3668

            expect(testValue.minutesPlace) == 1
        }

        it("returns integer hours") {
            let testValue: TimeInterval = 8765.4322

            expect(testValue.hours) == 2
            expect(testValue.minutesPlace) == 26
            expect(testValue.secondsPlace) == 5
        }
    }
}
