import UIKit
import SnapKit
import ThemeKit

open class SliderButton: UIView {
    public static let height: CGFloat = .margin6 + .heightButton + .margin6

    private let label = UILabel()
    private let imageView = UIImageView()

    private var initialPosition: CGFloat?
    private var maxPosition: CGFloat?

    public var onTap: (() -> ())?

    public var isEnabled: Bool = true {
        didSet {
            syncState()
        }
    }

    public init() {
        super.init(frame: .zero)

        backgroundColor = .themeSteel20
        cornerRadius = Self.height / 2
        layer.cornerCurve = .continuous

        snp.makeConstraints { make in
            make.height.equalTo(Self.height)
        }

        addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(CGFloat.heightButton + CGFloat.margin6 + CGFloat.margin6)
            make.trailing.equalToSuperview().inset(CGFloat.margin16)
            make.centerY.equalToSuperview()
        }

        label.textAlignment = .center
        label.font = .headline2

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(CGFloat.margin6)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGFloat.heightButton)
        }

        imageView.contentMode = .center
        imageView.cornerRadius = CGFloat.heightButton / 2

        syncState()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onTouch))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func syncState() {
        imageView.backgroundColor = isEnabled ? .themeJacob : .themeSteel20
        imageView.image = imageView.image?.withTintColor(isEnabled ? .themeDark : .themeGray50)
        label.textColor = isEnabled ? .themeGray : .themeGray50
    }

    @objc private func onTouch(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard isEnabled else {
            return
        }

        guard let touchedView = gestureRecognizer.view else {
            return
        }

        if initialPosition == nil {
            initialPosition = touchedView.frame.origin.x
            maxPosition = frame.width - touchedView.width - .margin6
        }

        guard let initialPosition, let maxPosition else {
            return
        }

        switch gestureRecognizer.state {
        case .changed:
            let translation = gestureRecognizer.translation(in: touchedView.superview)
            var newPosition = initialPosition + translation.x

            if newPosition < initialPosition {
                newPosition = initialPosition
            } else if newPosition > maxPosition {
                newPosition = maxPosition
            }

            touchedView.frame.origin.x = newPosition

            let diff = max(0, (maxPosition / 2) - newPosition)
            label.alpha = diff / (maxPosition - initialPosition)
        case .ended:
            if touchedView.frame.origin.x == maxPosition {
                label.alpha = 0
                imageView.isUserInteractionEnabled = false
                onTap?()
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) { [weak self] in
                    touchedView.frame.origin.x = initialPosition
                    self?.label.alpha = 1
                    self?.layoutIfNeeded()
                }
            }
        default: ()
        }
    }

    public var title: String? {
        get { label.text }
        set { label.text = newValue }
    }

    public var image: UIImage? {
        get { imageView.image }
        set {
            imageView.image = newValue
            syncState()
        }
    }

}
