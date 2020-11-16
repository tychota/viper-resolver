import AsyncDisplayKit
import Foundation
import Resolver

protocol Login2ViewControllerInput: UIViewController {}

class Login2ViewController: ASViewController<ASDisplayNode>, Login2ViewControllerInput {
    @Injected var presenter: Login2PresenterOutput
    init() {
        super.init(node: Login2ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.handleViewWillAppear()
    }
    
    
}
