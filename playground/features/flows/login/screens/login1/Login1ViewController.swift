import AsyncDisplayKit
import Foundation
import Resolver

protocol Login1ViewControllerInput: UIViewController {}

class Login1ViewController: ASViewController<ASDisplayNode>, Login1ViewControllerInput {
    @Injected var presenter: Login1PresenterOutput
     init() {
        super.init(node: Login1ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppearTrigger.accept(())
    }
    
}
