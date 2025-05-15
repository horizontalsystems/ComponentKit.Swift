import SnapKit
import ThemeKit
import UIKit

open class PrimaryCircleButton: UIButton {
    public static let size: CGFloat = .heightButton

    private var style: Style?

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.size / 2

        setBackgroundColor(.themeSteel20, for: .disabled)

        snp.makeConstraints { maker in
            maker.size.equalTo(Self.size)
        }
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(image: UIImage?) {
        switch style {
        case .orange:
            setImage(image?.withTintColor(.themeLawrence), for: .normal)
            setImage(image?.withTintColor(.themeLawrence), for: .highlighted)
        case .leah:
            setImage(image?.withTintColor(.themeTyler), for: .normal)
            setImage(image?.withTintColor(.themeTyler), for: .highlighted)
        case nil:
            setImage(image?.withTintColor(.themeBlade), for: .normal)
            setImage(image?.withTintColor(.themeBlade), for: .highlighted)
        }

        setImage(image?.withTintColor(.themeAndy), for: .disabled)
    }

    public func set(style: Style) {
        self.style = style

        switch style {
        case .orange:
            setBackgroundColor(.themeOrange, for: .normal)
            setBackgroundColor(.themeOrange.pressed, for: .highlighted)
            setBackgroundColor(.themeBlade, for: .disabled)
        case .leah:
            setBackgroundColor(.themeLeah, for: .normal)
            setBackgroundColor(.themeLeah.pressed, for: .highlighted)
            setBackgroundColor(.themeBlade, for: .highlighted)
        }
    }

    public enum Style {
        case orange
        case leah
    }
}
