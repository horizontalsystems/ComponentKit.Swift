import UIKit
import ThemeKit
import SnapKit

open class PrimaryButton: UIButton {
    private static let horizontalPadding: CGFloat = .margin16
    private static let leftPaddingWithImage: CGFloat = 18
    private static let rightPaddingWithImage: CGFloat = 26
    private static let imageMargin: CGFloat = .margin8
    public static let height: CGFloat = .heightButton

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.height / 2
        layer.cornerCurve = .continuous

        titleLabel?.font = .headline2
        setTitleColor(.themeGray50, for: .disabled)

        snp.makeConstraints { maker in
            maker.height.equalTo(Self.height)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(style: Style, image: UIImage? = nil) {
        switch style {
        case .yellow:
            setBackgroundColor(.themeYellowD, for: .normal)
            setBackgroundColor(.themeYellow50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .red:
            setBackgroundColor(.themeLucian, for: .normal)
            setBackgroundColor(.themeRed50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .gray:
            setBackgroundColor(.themeLeah, for: .normal)
            setBackgroundColor(.themeNina, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .transparent:
            setBackgroundColor(.clear, for: .normal)
            setBackgroundColor(.clear, for: .highlighted)
            setBackgroundColor(.clear, for: .disabled)
        }

        switch style {
        case .yellow:
            setTitleColor(.themeDark, for: .normal)
            setTitleColor(.themeDark, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .red, .gray:
            setTitleColor(.themeClaude, for: .normal)
            setTitleColor(.themeClaude, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .transparent:
            setTitleColor(.themeLeah, for: .normal)
            setTitleColor(.themeGray, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        }

        if let image = image {
            switch style {
            case .yellow:
                setImage(image.withTintColor(.themeDark), for: .normal)
                setImage(image.withTintColor(.themeDark), for: .highlighted)
                setImage(image.withTintColor(.themeGray50), for: .disabled)
            case .red, .gray:
                setImage(image.withTintColor(.themeClaude), for: .normal)
                setImage(image.withTintColor(.themeClaude), for: .highlighted)
                setImage(image.withTintColor(.themeGray50), for: .disabled)
            case .transparent:
                setImage(image.withTintColor(.themeLeah), for: .normal)
                setImage(image.withTintColor(.themeGray), for: .highlighted)
                setImage(image.withTintColor(.themeGray50), for: .disabled)
            }

            let verticalPadding = (height - CGFloat.iconSize24) / 2
            titleEdgeInsets = UIEdgeInsets(top: 0, left: Self.imageMargin, bottom: 0, right: -Self.imageMargin)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -Self.imageMargin, bottom: 0, right: Self.imageMargin)
            contentEdgeInsets = UIEdgeInsets(top: verticalPadding, left: Self.leftPaddingWithImage + Self.imageMargin, bottom: verticalPadding, right: Self.rightPaddingWithImage + Self.imageMargin)
        } else {
            titleEdgeInsets = .zero
            imageEdgeInsets = .zero
            contentEdgeInsets = UIEdgeInsets(top: 0, left: Self.horizontalPadding, bottom: 0, right: Self.horizontalPadding)
        }
    }

    public enum Style {
        case yellow
        case red
        case gray
        case transparent
    }

}
