import AsyncDisplayKit
import Resolver

class Login2ScreenNode: ASDisplayNode {
    @Injected var presenter: Login2PresenterOutput
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
        node.attributedText = NSAttributedString(string: "Login2", attributes: attributes)
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
    
    lazy var homeButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("Login", with: nil, with: .blue, for: .normal)
        node.backgroundColor = .white
        return node
    }()
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
}

extension Login2ScreenNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let frontSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .spaceAround,
            alignItems: .center,
            children: [pageNameNode, sessionNameNode, homeButton]
        )
        let bodyInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let bodySpecWithInsets = ASInsetLayoutSpec(insets: bodyInsets, child: frontSpec)
        let bodySpec = ASBackgroundLayoutSpec(child: bodySpecWithInsets, background: bodyBackground)
        bodySpec.style.flexGrow = 2

        return bodySpec
    }
}

extension Login2ScreenNode {
    override func didLoad() {
        homeButton.addTarget(
            self,
            action: #selector(homeButtonPressed),
            forControlEvents: .touchUpInside
        )
    }
    @objc func homeButtonPressed() { presenter.handleHomeButtonPressed() }
}
