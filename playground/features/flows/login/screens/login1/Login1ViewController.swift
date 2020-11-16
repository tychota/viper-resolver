import AsyncDisplayKit
import Foundation
import Resolver

protocol Login1ViewControllerInput: UIViewController {
    func setCurrentSession(currentSession: Session)
}

class Login1ViewController: ASDKViewController<ASDisplayNode>, Login1ViewControllerInput {
    @Injected var presenter: Login1PresenterOutput
    override init() {
        super.init(node: Login1ScreenNode())
        view.backgroundColor = .blue
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.handleViewWillAppear()
    }
    
    func setCurrentSession(currentSession: Session) {
        if let node = self.node as? Login1ScreenNode {
            node.sessionNameNode.attributedText = NSAttributedString(string: currentSession.id.uuidString)
            
        }
    }
}
