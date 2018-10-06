import Foundation

protocol PresenterType {
    func registerCountdownTextRecipient(_ recipient: CountdownTextRecipient?)
}

class Presenter {
    private var countdown: Countdown?
    init() {
        countdown = Countdown(delegate: self)
    }

    fileprivate var countdownTextRecipients: [CountdownTextRecipient?] = []

    fileprivate func reportTimeRemaining(_ seconds: TimeInterval) {
        let hoursText = seconds.hours > 0 ? "\(seconds.hours)h" : ""
        let minutesText = seconds.minutesPlace > 0 ? "\(seconds.minutesPlace)m" : ""
        let countdownText = "\(hoursText)\(minutesText)\(seconds.secondsPlace)s"
        countdownTextRecipients
            .compactMap { $0 }
            .forEach { recipient in
                recipient.countdownText = countdownText
        }
    }
}

extension Presenter: PresenterType {
    func registerCountdownTextRecipient(_ recipient: CountdownTextRecipient?) {
        guard let recipient = recipient else { return }
        countdownTextRecipients.append(recipient)
        countdown?.tickNow()
    }
}

extension Presenter: CountdownDelegate {
    func timeRemainingIs(_ seconds: TimeInterval) {
        reportTimeRemaining(seconds)
    }
}
