import Foundation
import Quick
import Nimble

@testable import GTFONYC

class ViewControllerTests: QuickSpec {
    override func spec() {
        func makeViewController(presenter: PresenterType) -> ViewController {
            let viewController = ViewController(nibName: ViewController.nibName, bundle: nil)
            viewController.presenter = presenter
            return viewController
        }

        it("registers itself with the presenter") {
            let mockPresenter = MockPresenter()
            let viewController = makeViewController(presenter: mockPresenter)

            expect(mockPresenter.registerCountdownTextRecipientCallCount) == 1
            expect(mockPresenter.registerCountdownTextRecipientRecipients.first as Any?) === viewController
        }
    }
}
