import UIKit
import ThemeKit
import SnapKit

open class PrimaryButton: UIButton {
    private static let horizontalPadding: CGFloat = .margin16
    public static let height: CGFloat = .heightButton

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.height / 2
        layer.cornerCurve = .continuous

        titleLabel?.font = .headline2
        setTitleColor(.themeGray50, for: .disabled)

        syncInsets()

        snp.makeConstraints { maker in
            maker.height.equalTo(Self.height)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func syncInsets() {
        if image(for: .normal) != nil {
            titleEdgeInsets = UIEdgeInsets(top: 0, left: .margin4, bottom: 0, right: -.margin4)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -.margin4, bottom: 0, right: .margin4)
            contentEdgeInsets = UIEdgeInsets(top: .margin4, left: .margin4, bottom: .margin4, right: .margin8 + .margin4)
        } else {
            titleEdgeInsets = .zero
            imageEdgeInsets = .zero
            contentEdgeInsets = UIEdgeInsets(top: 0, left: Self.horizontalPadding, bottom: 0, right: Self.horizontalPadding)
        }
    }

    public func set(style: Style) {
        switch style {
        case .yellow:
            setTitleColor(.themeDark, for: .normal)
            setBackgroundColor(.themeYellowD, for: .normal)
            setBackgroundColor(.themeYellow50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .red:
            setTitleColor(.themeClaude, for: .normal)
            setBackgroundColor(.themeLucian, for: .normal)
            setBackgroundColor(.themeRed50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .gray:
            setTitleColor(.themeClaude, for: .normal)
            setBackgroundColor(.themeLeah, for: .normal)
            setBackgroundColor(.themeNina, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .transparent:
            setTitleColor(.themeLeah, for: .normal)
            setTitleColor(.themeGray, for: .highlighted)
            setBackgroundColor(.clear, for: .normal)
            setBackgroundColor(.clear, for: .highlighted)
            setBackgroundColor(.clear, for: .disabled)
        }
    }

    public enum Style {
        case yellow
        case red
        case gray
        case transparent
    }

}
