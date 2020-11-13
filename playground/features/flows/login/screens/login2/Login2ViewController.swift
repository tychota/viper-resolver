import AsyncDisplayKit
import Foundation
import Resolver

protocol Login2ViewControllerInput: UIViewController {}

class Login2ViewController: ASDKViewController<ASDisplayNode>, Login2ViewControllerInput {
    @Injected var presenter: Login2PresenterOutput
    override init() {
        super.init(node: Login2ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
