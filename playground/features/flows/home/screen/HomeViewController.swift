import AsyncDisplayKit
import Resolver

protocol HomeViewControllerInput: class {
    func setCurrentSession(currentSession: Session)
}

class HomeViewController: ASDKViewController<ASDisplayNode>, HomeViewControllerInput {
    
    @Injected var presenter: HomePresenterOutput
    override init() {
        super.init(node: HomeScreenNode())
        view.backgroundColor = .purple
    }
    required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.handleViewWillAppear()
    }
    
    func setCurrentSession(currentSession: Session) {
        if let node = self.node as? HomeScreenNode {
            node.sessionNameNode.attributedText = NSAttributedString(string: currentSession.id.uuidString)
        }
    }
}
