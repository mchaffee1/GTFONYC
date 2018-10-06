import Foundation

@testable import GTFONYC

class MockPresenter: PresenterType {
    var registerCountdownTextRecipientCallCount = 0
    var registerCountdownTextRecipientRecipients = [CountdownTextRecipient?]()
    func registerCountdownTextRecipient(_ recipient: CountdownTextRecipient?) {
        registerCountdownTextRecipientCallCount += 1
        registerCountdownTextRecipientRecipients.append(recipient)
    }
}
