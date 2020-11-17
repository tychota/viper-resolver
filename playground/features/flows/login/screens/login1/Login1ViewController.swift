import AsyncDisplayKit
import Foundation
import Resolver

class Login1ViewController: ASViewController<ASDisplayNode> {
    @Injected var presenter: Login1Presenter
     init() {
        super.init(node: Login1ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppearTrigger.accept(())
    }
    
}
