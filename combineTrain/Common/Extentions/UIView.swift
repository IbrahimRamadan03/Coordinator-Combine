import UIKit

extension UIView {
    
    /// Adds a **vertical** gradient from top to bottom
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // Top center
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)   // Bottom center
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// Adds a **horizontal** gradient from left to right
    func addHorizontalGradient(leftColor: UIColor, rightColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5) // Left center
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)   // Right center
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// Applies corner radius to specific corners
    func applyCornerRadius(_ radius: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
