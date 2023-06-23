import UIKit
import SnapKit

open class BottomDescriptionHeaderFooterView: UITableViewHeaderFooterView {
    private let descriptionView = BottomDescriptionView()

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(descriptionView)
        descriptionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().priority(.high)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open var text: String? {
        get { descriptionView.text }
        set { descriptionView.text = newValue }
    }

    open var textColor: UIColor? {
        get { descriptionView.textColor }
        set { descriptionView.textColor = newValue }
    }

}

extension BottomDescriptionHeaderFooterView {

    public static func height(containerWidth: CGFloat, text: String) -> CGFloat {
        BottomDescriptionView.height(containerWidth: containerWidth, text: text)
    }

}
