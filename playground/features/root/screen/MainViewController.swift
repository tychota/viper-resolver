import AsyncDisplayKit
import Resolver

protocol MainViewControllerInput: UIViewController {}

class MainViewController: ASDKViewController<ASDisplayNode>, MainViewControllerInput {
    @Injected var presenter: MainPresenterOutput
    override init() {
        super.init(node: ASDisplayNode())
        view.backgroundColor = .yellow
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func viewDidAppear(_ animated: Bool) { presenter.handleDidAppear() }
}
