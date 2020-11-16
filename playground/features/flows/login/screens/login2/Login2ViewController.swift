import AsyncDisplayKit
import Foundation
import Resolver

protocol Login2ViewControllerInput: UIViewController {
    func setCurrentSession(currentSession: Session)
}

class Login2ViewController: ASDKViewController<ASDisplayNode>, Login2ViewControllerInput {
    @Injected var presenter: Login2PresenterOutput
    override init() {
        super.init(node: Login2ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.handleViewWillAppear()
    }
    
    func setCurrentSession(currentSession: Session) {
        if let node = self.node as? Login2ScreenNode {
            node.sessionNameNode.attributedText = NSAttributedString(string: currentSession.id.uuidString)
            
        }
    }
    
}
