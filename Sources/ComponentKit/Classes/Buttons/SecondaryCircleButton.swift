import SnapKit
import ThemeKit
import UIKit

open class SecondaryCircleButton: UIButton {
    public static let size: CGFloat = 28

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.size / 2

        snp.makeConstraints { maker in
            maker.size.equalTo(Self.size)
        }
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(image: UIImage?, style: Style = .default) {
        switch style {
        case .active:
            setBackgroundColor(.orange, for: .normal)
            setBackgroundColor(.orange.pressed, for: .highlighted)
            setBackgroundColor(.themeAndy, for: .disabled)
        case .default:
            setBackgroundColor(.themeBlade, for: .normal)
            setBackgroundColor(.themeBlade.pressed, for: .highlighted)
            setBackgroundColor(.themeAndy, for: .disabled)
        case .transparent:
            setBackgroundColor(.clear, for: .normal)
            setBackgroundColor(.clear, for: .highlighted)
            setBackgroundColor(.clear, for: .disabled)
        }

        switch style {
        case .default:
            setImage(image?.withTintColor(.themeLeah), for: .normal)
            setImage(image?.withTintColor(.themeLeah), for: .highlighted)
            setImage(image?.withTintColor(.themeAndy), for: .disabled)
//            setImage(image?.withTintColor(.themeJacob), for: .selected)
//            setImage(image?.withTintColor(.themeOrange.pressed), for: [.selected, .highlighted])
        case .transparent:
            setImage(image?.withTintColor(.themeGray), for: .normal)
            setImage(image?.withTintColor(.themeGray.pressed), for: .highlighted)
            setImage(image?.withTintColor(.themeAndy), for: .disabled)
//            setImage(image?.withTintColor(.themeLeah), for: .selected)
//            setImage(image?.withTintColor(.themeGray), for: [.selected, .highlighted])
        case .active:
            setImage(image?.withTintColor(.themeLawrence), for: .normal)
            setImage(image?.withTintColor(.themeLawrence), for: .highlighted)
            setImage(image?.withTintColor(.themeAndy), for: .disabled)
//            setImage(image?.withTintColor(.themeJacob), for: .selected)
//            setImage(image?.withTintColor(.themeOrange.pressed), for: [.selected, .highlighted])
        }
    }
}

public extension SecondaryCircleButton {
    enum Style {
        case `default`
        case transparent
        case active
    }
}
