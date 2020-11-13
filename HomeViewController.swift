import Resolver
import AsyncDisplayKit

protocol HomeViewInput: class {
    
}

class HomeViewController: ASDKViewController<ASDisplayNode>, HomeViewInput {
    @Injected var presenter: HomePresenterOutput
    
    override init() {
        super.init(node: ASDisplayNode())
        view.backgroundColor = .purple
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
