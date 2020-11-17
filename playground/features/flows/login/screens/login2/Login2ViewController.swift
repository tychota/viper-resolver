import AsyncDisplayKit
import Foundation
import Resolver

class Login2ViewController: ASViewController<ASDisplayNode> {
    @Injected var presenter: Login2Presenter
    init() {
        super.init(node: Login2ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppearTrigger.accept(())
    }
    
    
}
