import UIKit
import SnapKit
import ThemeKit

open class SliderButton: UIView {
    public static let height: CGFloat = .margin6 + .heightButton + .margin6

    private let initialBackground = UIView()
    private let finalBackground = UIView()

    private let label = UILabel()

    private let initialImageView = UIImageView()
    private let finalImageView = UIImageView()

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

        cornerRadius = Self.height / 2
        layer.cornerCurve = .continuous

        snp.makeConstraints { make in
            make.height.equalTo(Self.height)
        }

        addSubview(initialBackground)
        initialBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        initialBackground.backgroundColor = .themeSteel20

        addSubview(finalBackground)
        finalBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        finalBackground.backgroundColor = .themeYellowD
        finalBackground.alpha = 0

        addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(CGFloat.margin16)
            make.centerY.equalToSuperview()
        }

        label.textAlignment = .center
        label.font = .headline2

        addSubview(initialImageView)
        initialImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(CGFloat.margin6)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGFloat.heightButton)
        }

        initialImageView.contentMode = .center
        initialImageView.cornerRadius = CGFloat.heightButton / 2

        addSubview(finalImageView)
        finalImageView.snp.makeConstraints { make in
            make.center.equalTo(initialImageView)
            make.size.equalTo(CGFloat.heightButton)
        }

        finalImageView.contentMode = .center
        finalImageView.cornerRadius = CGFloat.heightButton / 2
        finalImageView.backgroundColor = .themeLeah
        finalImageView.alpha = 0

        syncState()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onTouch))
        initialImageView.isUserInteractionEnabled = true
        initialImageView.addGestureRecognizer(gestureRecognizer)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func syncState() {
        initialImageView.backgroundColor = isEnabled ? .themeJacob : .themeSteel20
        initialImageView.image = initialImageView.image?.withTintColor(isEnabled ? .themeDark : .themeGray50)
        label.textColor = isEnabled ? .themeGray : .themeGray50
    }

    private func sync(alpha: CGFloat) {
        finalBackground.alpha = alpha
        finalImageView.alpha = alpha
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
            finalImageView.frame.origin.x = newPosition

            let length = maxPosition - initialPosition
            let currentLength = newPosition - initialPosition
            sync(alpha: max(0, min(1, currentLength / length)))
            label.alpha = max(0, min(1, 1 - currentLength * 2 / length))
        case .ended:
            if touchedView.frame.origin.x == maxPosition {
                sync(alpha: 1)
                label.alpha = 0
                initialImageView.isUserInteractionEnabled = false
                onTap?()
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) { [weak self] in
                    touchedView.frame.origin.x = initialPosition
                    self?.finalImageView.frame.origin.x = initialPosition
                    self?.sync(alpha: 0)
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
        get { initialImageView.image }
        set {
            initialImageView.image = newValue
            finalImageView.image = newValue?.withTintColor(.themeClaude)
            syncState()
        }
    }

}
