import AsyncDisplayKit
import Resolver


class MainViewController: ASViewController<ASDisplayNode> {
    @Injected var presenter: MainPresenter
    init() {
        super.init(node: ASDisplayNode())
        view.backgroundColor = .yellow
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func viewDidAppear(_ animated: Bool) { presenter.viewDidAppearTrigger.accept(()) }
}
