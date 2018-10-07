import Foundation

protocol PresenterType {
    func registerCountdownTextRecipient(_ recipient: CountdownTextRecipient?)
}

class Presenter {
    fileprivate typealias Class = Presenter
    static let TIMES_UP_TEXT = "It's over it's over it's over"

    private var countdown: Countdown?
    init() {
        countdown = Countdown(delegate: self)
    }

    fileprivate var countdownTextRecipients: [CountdownTextRecipient?] = []

    fileprivate func reportTimeRemaining(_ seconds: TimeInterval) {
        guard seconds > 0 else {
            reportNegativeTimeRemaining()
            return
        }
        let hoursText = seconds.hours > 0 ? "\(seconds.hours)h" : ""
        let minutesText = seconds.minutesPlace > 0 ? "\(seconds.minutesPlace)m" : ""
        let countdownText = "\(hoursText)\(minutesText)\(seconds.secondsPlace)s"
        reportCountdownText(countdownText)
    }

    fileprivate func reportNegativeTimeRemaining() {
        reportCountdownText(Class.TIMES_UP_TEXT)
    }

    private func reportCountdownText(_ countdownText: String) {
        self.countdownTextRecipients
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
