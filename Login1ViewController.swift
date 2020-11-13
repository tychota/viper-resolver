import Foundation

import Resolver
import AsyncDisplayKit

protocol Login1ViewControllerInput: UIViewController {}

class Login1ViewController: ASDKViewController<ASDisplayNode>, Login1ViewControllerInput {
    @Injected var presenter: Login1PresenterOutput
    
    override init() {
        super.init(node: ASDisplayNode())
        view.backgroundColor = .blue
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
