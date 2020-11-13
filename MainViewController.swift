import Resolver
import AsyncDisplayKit

protocol ViewInput: class {
    
}

class MainViewController: ASDKViewController<ASDisplayNode>, ViewInput {
    @Injected var presenter: MainPresenterOutput
    
    override init() {
        super.init(node: ASDisplayNode())
        view.backgroundColor = .yellow
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
