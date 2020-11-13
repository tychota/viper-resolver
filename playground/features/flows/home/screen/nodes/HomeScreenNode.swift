import AsyncDisplayKit
import Resolver

class HomeScreenNode: ASDisplayNode {
    @Injected var presenter: HomePresenterOutput
    lazy var bodyBackground: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .white
        return node
    }()
    lazy var pageNameNode: ASTextNode2 = {
        let node = ASTextNode2()
        let attributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)]
        node.attributedText = NSAttributedString(string: "Home", attributes: attributes)
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
            children: [pageNameNode, logoutButton]
        )
        let bodyInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let bodySpecWithInsets = ASInsetLayoutSpec(insets: bodyInsets, child: frontSpec)
        let bodySpec = ASBackgroundLayoutSpec(child: bodySpecWithInsets, background: bodyBackground)
        bodySpec.style.flexGrow = 1

        return bodySpec
    }
}

extension HomeScreenNode {
    override func didLoad() { logoutButton.addTarget(self, action: #selector(logoutButtonPressed), forControlEvents: .touchUpInside) }
    @objc func logoutButtonPressed() { presenter.handleLogoutButtonPressed() }
}