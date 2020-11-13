import AsyncDisplayKit
import Resolver

class Login1ScreenNode: ASDisplayNode {
    @Injected var presenter: Login1PresenterOutput
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
        node.attributedText = NSAttributedString(string: "Login1", attributes: attributes)
        node.backgroundColor = .white
        return node
    }()
    lazy var homeButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("Next", with: nil, with: .blue, for: .normal)
        node.backgroundColor = .white
        return node
    }()
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
}

extension Login1ScreenNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let frontSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .spaceAround,
            alignItems: .center,
            children: [pageNameNode, homeButton]
        )
        let bodyInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let bodySpecWithInsets = ASInsetLayoutSpec(insets: bodyInsets, child: frontSpec)
        let bodySpec = ASBackgroundLayoutSpec(child: bodySpecWithInsets, background: bodyBackground)
        bodySpec.style.flexGrow = 1

        return bodySpec
    }
}

extension Login1ScreenNode {
    override func didLoad() {
        homeButton.addTarget(
            self,
            action: #selector(homeButtonPressed),
            forControlEvents: .touchUpInside
        )
    }
    @objc func homeButtonPressed() { presenter.handleHomeButtonPressed() }
}
