import UIKit

class HeaderView: UIView {
    
    // Constants
    let backButtonSize: CGFloat = 50
    
    var backButton: FocusedButton!
    var hideMeLogo: UIImageView!
    var titleLabel: Heading2Label!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }
    
    override func didMoveToSuperview() {
        guard superview != nil else { return }
        defineLayoutForViews()
    }
    
    private func buildViews() {
        createViews()
        styleViews()
    }
    
    private func createViews() {
        backButton = asSubview()
        backButton.setImage(UIImage(named: "icon_back")?.withRenderingMode(.alwaysTemplate), for: .normal)

        hideMeLogo = asSubview()
        hideMeLogo.image = UIImage(named: "hide_me_logo")
        
        titleLabel = asSubview()
        titleLabel.isHidden = true
    }
    
    private func styleViews() {
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.imageView?.tintColor = .white
        backButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 2)
        backButton.setFocusedColor(.blueDark.withAlphaComponent(0.5))
        backButton.setNormalColor(.clear)
        
        hideMeLogo.contentMode = .scaleAspectFill
    }
    
    func setTitle(title: String) {
        hideMeLogo.isHidden = true
        titleLabel.isHidden = false
        titleLabel.text = title
    }
    
    private func defineLayoutForViews() {
        topAnchorToSuperview()
        leadingAnchorToSuperview()
        trailingAnchorToSuperview()
//        height(100)
        
        backButton.height(backButtonSize)
        backButton.width(backButtonSize)
        backButton.centerYAnchorToSuperview()
        backButton.leadingAnchorToSuperview(constant: 30)
        backButton.topAnchorToSuperview(constant: 30)
        backButton.bottomAnchorToSuperview(constant: 30)
        
        hideMeLogo.centerXAnchorToSuperview()
        hideMeLogo.centerYAnchorToSuperview()
        hideMeLogo.height(55)

        titleLabel.centerXAnchorToSuperview()
        titleLabel.centerYAnchorToSuperview()
    }
    
}
