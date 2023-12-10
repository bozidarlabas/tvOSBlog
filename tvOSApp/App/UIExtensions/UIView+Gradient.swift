import UIKit

extension UIView {
    func setGradientBackground(topLeftColor: UIColor, bottomRightColor: UIColor) {
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = self.bounds
                let color1 = topLeftColor.cgColor
                let color2 = bottomRightColor.cgColor
                gradientLayer.colors = [color1, color2]
                gradientLayer.startPoint = CGPointMake(0.0, 0.5)
                gradientLayer.locations = [0.0, 1.0]
                self.layer.addSublayer(gradientLayer)
        
    }
}
