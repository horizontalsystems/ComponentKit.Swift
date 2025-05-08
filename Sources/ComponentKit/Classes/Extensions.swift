import Kingfisher
import UIKit

public extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))

        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.white.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))

            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            setBackgroundImage(image?.withTintColor(color), for: state)
        }
    }
}

extension UIView {
    @IBInspectable
    open var cornerCurve: CALayerCornerCurve {
        get {
            layer.cornerCurve
        }
        set {
            layer.cornerCurve = newValue
        }
    }
}

extension UIRectEdge {
    var toArray: [UIRectEdge] {
        let all: [UIRectEdge] = [.top, .right, .bottom, .left]
        return all.filter { edge in contains(edge) }
    }

    var corners: [UIRectCorner] {
        var corners = [UIRectCorner]()
        if contains([.top, .left]) { corners.append(.topLeft) }
        if contains([.top, .right]) { corners.append(.topRight) }
        if contains([.bottom, .left]) { corners.append(.bottomLeft) }
        if contains([.bottom, .right]) { corners.append(.bottomRight) }
        return corners
    }
}

public extension UIImageView {
    func setImage(url urlString: String?, alternativeUrl alternativeUrlString: String? = nil, placeholder: UIImage? = nil) {
        image = nil

        let options: [KingfisherOptionsInfoItem] = [.onlyLoadFirstFrame, .transition(.fade(0.5))]
        let url = urlString.flatMap { URL(string: $0) }

        if let alternativeUrlString, let alternativeUrl = URL(string: alternativeUrlString) {
            if ImageCache.default.isCached(forKey: alternativeUrlString) {
                kf.setImage(with: alternativeUrl, placeholder: placeholder, options: options)
            } else {
                kf.setImage(with: url, placeholder: placeholder, options: options + [.alternativeSources([.network(alternativeUrl)])])
            }
        } else {
            kf.setImage(with: url, placeholder: placeholder, options: options)
        }
    }
}
