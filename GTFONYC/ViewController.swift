import UIKit

protocol CountdownTextRecipient: class {
    var countdownText: String { get set }
}

class ViewController: UIViewController {
    static let nibName = "Main"

    @IBOutlet weak var countdownLabel: UILabel?

    var presenter: PresenterType? {
        didSet {
            presenter?.registerCountdownTextRecipient(self)
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Wireframe.shared.register(self)
    }

    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
    }
}

extension ViewController: CountdownTextRecipient {
    var countdownText: String {
        get { return countdownLabel?.text ?? "" }
        set { countdownLabel?.text = newValue }
    }
}
