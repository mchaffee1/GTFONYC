import Foundation

class Wireframe {
    static let shared = Wireframe()

    fileprivate let presenter = Presenter()

    func register(_ child: Any?) {
        if let countdownTextRecipient = child as? CountdownTextRecipient {
            presenter.registerCountdownTextRecipient(countdownTextRecipient)
        }
    }
}
