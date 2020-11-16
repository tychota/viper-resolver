import AsyncDisplayKit
import Resolver
import RxSwift

class HomeScreenNode: ASDisplayNode {
    @Injected var presenter: HomePresenterOutput
    
    let disposeBag = DisposeBag()
    
    lazy var bodyBackground: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .white
        return node
    }()
    
    lazy var pageNameNode: ASTextNode2 = {
        let node = ASTextNode2()
        let attributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        node.attributedText = NSAttributedString(string: "Home", attributes: attributes)
        node.backgroundColor = .white
        return node
    }()
    
    lazy var sessionNameNode: ASTextNode2 = {
        let node = ASTextNode2()
        let attributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)
        ]
        node.attributedText = NSAttributedString(string: "session_placeholder", attributes: attributes)
        node.backgroundColor = .white
        return node
    }()
    
    lazy var logoutButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("Logout", with: nil, with: .blue, for: .normal)
        node.backgroundColor = .white
        return node
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
}

extension HomeScreenNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let frontSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .spaceAround,
            alignItems: .center,
            children: [pageNameNode, sessionNameNode, logoutButton]
        )
        let bodyInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let bodySpecWithInsets = ASInsetLayoutSpec(insets: bodyInsets, child: frontSpec)
        let bodySpec = ASBackgroundLayoutSpec(child: bodySpecWithInsets, background: bodyBackground)
        bodySpec.style.flexGrow = 1

        return bodySpec
    }
}

extension HomeScreenNode {
    override func didLoad() {
        logoutButton.rx.tap
            .bind(to: presenter.goToLoginTrigger)
            .disposed(by: disposeBag)
        
        presenter.currentUUID.map { currentUUID in
            NSAttributedString(string: currentUUID)
        }
        .bind(to: sessionNameNode.rx.attributedText, setNeedsLayout: self)
        .disposed(by: disposeBag)
    }
}
