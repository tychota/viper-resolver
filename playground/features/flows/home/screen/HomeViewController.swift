import AsyncDisplayKit
import Resolver

class HomeViewController: ASViewController<ASDisplayNode> {
    
    @Injected var presenter: HomePresenter
    init() {
        super.init(node: HomeScreenNode())
        view.backgroundColor = .purple
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppearTrigger.accept(())
    }
}
