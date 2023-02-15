import UIKit

open class BaseButton: UIButton {

    private static let dummyView: UIView = {
        let view = UIView(frame: .zero)
        view.isUserInteractionEnabled = true
        return view
    }()

    // prevent propagating touches when button is disabled
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isEnabled, self.point(inside: convert(point, to: self), with: event) {
            return Self.dummyView
        }

        return super.hitTest(point, with: event)
    }

}
