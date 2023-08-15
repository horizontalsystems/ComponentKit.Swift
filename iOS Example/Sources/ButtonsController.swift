import UIKit
import ThemeKit
import SnapKit
import ComponentKit
import SectionsTableView

class ButtonsController: ThemeViewController {
    private let tableView = SectionsTableView(style: .grouped)

    private let primaryYellowCell = BaseThemeCell()
    private let primaryYellowIconCell = BaseThemeCell()
    private let primaryYellowSpinnerCell = BaseThemeCell()
    private let primaryYellowIconCell2 = BaseThemeCell()
    private let primaryYellowSpinnerCell2 = BaseThemeCell()
    private let sliderCell = BaseThemeCell()
    private let sliderDisabledCell = BaseThemeCell()
    private let primaryRedCell = BaseThemeCell()
    private let primaryRedIconCell = BaseThemeCell()
    private let primaryGrayCell = BaseThemeCell()
    private let primaryGrayIconCell = BaseThemeCell()
    private let primaryTransparentIconCell = BaseThemeCell()
    private let primaryTransparentCell = BaseThemeCell()
    private let primaryCircleCell = BaseThemeCell()
    private let secondaryCell = BaseThemeCell()
    private let secondaryFullCell = BaseThemeCell()
    private let secondaryFull2Cell = BaseThemeCell()
    private let secondaryTransparentCell = BaseThemeCell()
    private let secondaryTransparent2Cell = BaseThemeCell()
    private let secondaryCircleCell = BaseThemeCell()
    private let transparentIconCell = BaseThemeCell()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.sectionDataSource = self

        configureCells()
        tableView.buildSections()
    }

    private func configureCells() {
        primaryYellowCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryYellowCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryYellowCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryYellowCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow)
            component.button.setTitle("Yellow", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })
        primaryYellowCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow)
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })

        primaryYellowIconCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryYellowIconCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryYellowIconCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary Icon"
        })
        primaryYellowIconCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.setTitle("Yellow", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })
        primaryYellowIconCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        primaryYellowSpinnerCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryYellowSpinnerCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryYellowSpinnerCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary Spinner"
        })
        primaryYellowSpinnerCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .spinner)
            component.button.setTitle("Yellow", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })
        primaryYellowSpinnerCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .spinner)
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        primaryYellowIconCell2.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryYellowIconCell2, elements: [.primaryButton])
        primaryYellowIconCell2.bind(index: 0, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.setTitle("Yellow", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        primaryYellowSpinnerCell2.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryYellowSpinnerCell2, elements: [.primaryButton])
        primaryYellowSpinnerCell2.bind(index: 0, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .yellow, accessoryType: .spinner)
            component.button.setTitle("Yellow", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        sliderCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: sliderCell, elements: [.sliderButton])
        sliderCell.bind(index: 0, block: { (component: SliderButtonComponent) in
            component.button.title = "Slide to Send"
            component.button.finalTitle = "Sending"
            component.button.slideImage = UIImage(named: "forward_24")
            component.button.finalImage = UIImage(named: "check_24")
            component.button.onTap = { print("On Tap Slider") }
        })

        sliderDisabledCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: sliderDisabledCell, elements: [.sliderButton])
        sliderDisabledCell.bind(index: 0, block: { (component: SliderButtonComponent) in
            component.button.isEnabled = false
            component.button.title = "Slide to Send"
            component.button.slideImage = UIImage(named: "forward_24")
        })

        primaryRedCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryRedCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryRedCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryRedCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .red)
            component.button.setTitle("Red", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })
        primaryRedCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .red)
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })

        primaryRedIconCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryRedIconCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryRedIconCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryRedIconCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .red, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.setTitle("Red", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })
        primaryRedIconCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .red, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        primaryGrayCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryGrayCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryGrayCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryGrayCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .gray)
            component.button.setTitle("Gray", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })
        primaryGrayCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .gray)
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
        })

        primaryGrayIconCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryGrayIconCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryGrayIconCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryGrayIconCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .gray, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.setTitle("Gray", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })
        primaryGrayIconCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .gray, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
        })

        primaryTransparentCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryTransparentCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryTransparentCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryTransparentCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .transparent)
            component.button.setTitle("Transparent", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        primaryTransparentCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .transparent)
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })

        primaryTransparentIconCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryTransparentIconCell, elements: [.text, .primaryButton, .margin8, .primaryButton])
        primaryTransparentIconCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary"
        })
        primaryTransparentIconCell.bind(index: 1, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .transparent, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.setTitle("Transparent", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        primaryTransparentIconCell.bind(index: 2, block: { (component: PrimaryButtonComponent) in
            component.button.set(style: .transparent, accessoryType: .icon(image: UIImage(named: "arrow_swap_2_24")))
            component.button.isEnabled = false
            component.button.setTitle("Disabled", for: .normal)
            component.button.setContentHuggingPriority(.required, for: .horizontal)
            component.button.setContentCompressionResistancePriority(.required, for: .horizontal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })

        primaryCircleCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: primaryCircleCell, elements: [.text, .primaryCircleButton, .margin4, .primaryCircleButton, .margin4, .primaryCircleButton, .margin4, .primaryCircleButton])
        primaryCircleCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Primary Circle"
        })
        primaryCircleCell.bind(index: 1, block: { (component: PrimaryCircleButtonComponent) in
            component.button.set(style: .yellow)
            component.button.set(image: UIImage(named: "arrow_swap_2_24"))
        })
        primaryCircleCell.bind(index: 2, block: { (component: PrimaryCircleButtonComponent) in
            component.button.set(style: .red)
            component.button.set(image: UIImage(named: "arrow_swap_2_24"))
        })
        primaryCircleCell.bind(index: 3, block: { (component: PrimaryCircleButtonComponent) in
            component.button.set(style: .gray)
            component.button.set(image: UIImage(named: "arrow_swap_2_24"))
        })
        primaryCircleCell.bind(index: 4, block: { (component: PrimaryCircleButtonComponent) in
            component.button.set(style: .yellow)
            component.button.isEnabled = false
            component.button.set(image: UIImage(named: "arrow_swap_2_24"))
        })

        secondaryCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryCell, elements: [.text, .secondaryButton, .margin4, .secondaryButton, .margin4, .secondaryButton])
        secondaryCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Secondary"
        })
        secondaryCell.bind(index: 1, block: { (component: SecondaryButtonComponent) in
            component.button.isSelected = true
            component.button.set(style: .default)
            component.button.setTitle("Selected", for: .normal)
        })
        secondaryCell.bind(index: 2, block: { (component: SecondaryButtonComponent) in
            component.button.set(style: .default)
            component.button.setTitle("Default", for: .normal)
        })
        secondaryCell.bind(index: 3, block: { (component: SecondaryButtonComponent) in
            component.button.isEnabled = false
            component.button.set(style: .default)
            component.button.setTitle("Disabled", for: .normal)
        })

        secondaryTransparentCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryTransparentCell, elements: [.text, .secondaryButton, .margin4, .secondaryButton, .margin4, .secondaryButton])
        secondaryTransparentCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Transparent"
        })
        secondaryTransparentCell.bind(index: 1, block: { (component: SecondaryButtonComponent) in
            component.button.isSelected = true
            component.button.set(style: .transparent)
            component.button.setTitle("Copy", for: .normal)
        })
        secondaryTransparentCell.bind(index: 2, block: { (component: SecondaryButtonComponent) in
            component.button.set(style: .transparent)
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        secondaryTransparentCell.bind(index: 3, block: { (component: SecondaryButtonComponent) in
            component.button.isEnabled = false
            component.button.set(style: .transparent)
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })

        secondaryTransparent2Cell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryTransparent2Cell, elements: [.text, .secondaryButton, .margin4, .secondaryButton, .margin4, .secondaryButton])
        secondaryTransparent2Cell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Transparent 2"
        })
        secondaryTransparent2Cell.bind(index: 1, block: { (component: SecondaryButtonComponent) in
            component.button.isSelected = true
            component.button.set(style: .transparent2)
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        secondaryTransparent2Cell.bind(index: 2, block: { (component: SecondaryButtonComponent) in
            component.button.set(style: .transparent2)
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        secondaryTransparent2Cell.bind(index: 3, block: { (component: SecondaryButtonComponent) in
            component.button.isEnabled = false
            component.button.set(style: .transparent2)
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })

        secondaryFullCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryFullCell, elements: [.text, .secondaryButton, .margin4, .secondaryButton, .margin4, .secondaryButton])
        secondaryFullCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Full"
        })
        secondaryFullCell.bind(index: 1, block: { (component: SecondaryButtonComponent) in
            component.button.isSelected = true
            component.button.set(style: .default, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
        })
        secondaryFullCell.bind(index: 2, block: { (component: SecondaryButtonComponent) in
            component.button.set(style: .default, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
        })
        secondaryFullCell.bind(index: 3, block: { (component: SecondaryButtonComponent) in
            component.button.isEnabled = false
            component.button.set(style: .default, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
        })

        secondaryFull2Cell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryFull2Cell, elements: [.text, .secondaryButton, .margin4, .secondaryButton, .margin4, .secondaryButton])
        secondaryFull2Cell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Full 2"
        })
        secondaryFull2Cell.bind(index: 1, block: { (component: SecondaryButtonComponent) in
            component.button.isSelected = true
            component.button.set(style: .transparent2, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        secondaryFull2Cell.bind(index: 2, block: { (component: SecondaryButtonComponent) in
            component.button.set(style: .transparent2, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        secondaryFull2Cell.bind(index: 3, block: { (component: SecondaryButtonComponent) in
            component.button.isEnabled = false
            component.button.set(style: .transparent2, image: UIImage(named: "icon_20"))
            component.button.setTitle("Copy", for: .normal)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })

        secondaryCircleCell.set(backgroundStyle: .transparent)
        CellBuilder.build(cell: secondaryCircleCell, elements: [.text, .secondaryCircleButton, .margin4, .secondaryCircleButton, .margin4, .secondaryCircleButton, .margin4, .secondaryCircleButton])
        secondaryCircleCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Secondary Circle"
        })
        secondaryCircleCell.bind(index: 1, block: { (component: SecondaryCircleButtonComponent) in
            component.button.isSelected = true
            component.button.set(image: UIImage(named: "icon_20"))
        })
        secondaryCircleCell.bind(index: 2, block: { (component: SecondaryCircleButtonComponent) in
            component.button.set(image: UIImage(named: "icon_20"))
        })
        secondaryCircleCell.bind(index: 3, block: { (component: SecondaryCircleButtonComponent) in
            component.button.set(image: UIImage(named: "icon_20"), style: .red)
        })
        secondaryCircleCell.bind(index: 4, block: { (component: SecondaryCircleButtonComponent) in
            component.button.isEnabled = false
            component.button.set(image: UIImage(named: "icon_20"))
        })

        transparentIconCell.set(backgroundStyle: .transparent, isLast: true)
        CellBuilder.build(cell: transparentIconCell, elements: [.text, .margin4, .secondaryCircleButton, .margin4, .secondaryCircleButton, .margin4, .secondaryCircleButton])
        transparentIconCell.bind(index: 0, block: { (component: TextComponent) in
            component.font = .subhead1
            component.textColor = .themeLeah
            component.text = "Sec Circle Trans"
        })
        transparentIconCell.bind(index: 1, block: { (component: SecondaryCircleButtonComponent) in
            component.button.isSelected = true
            component.button.set(image: UIImage(named: "icon_20"), style: .transparent)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        transparentIconCell.bind(index: 2, block: { (component: SecondaryCircleButtonComponent) in
            component.button.set(image: UIImage(named: "icon_20"), style: .transparent)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
        transparentIconCell.bind(index: 3, block: { (component: SecondaryCircleButtonComponent) in
            component.button.isEnabled = false
            component.button.set(image: UIImage(named: "icon_20"), style: .transparent)
            component.button.borderWidth = 1
            component.button.borderColor = .themeSteel10
        })
    }

}

extension ButtonsController: SectionsDataSource {

    func buildSections() -> [SectionProtocol] {
        [
            Section(
                    id: "main",
                    headerState: .margin(height: .margin12),
                    footerState: .margin(height: .margin32),
                    rows: [
                        StaticRow(cell: primaryYellowCell, id: "primary-yellow", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryYellowIconCell, id: "primary-yellow-icon", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryYellowSpinnerCell, id: "primary-yellow-spinner", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryYellowIconCell2, id: "primary-yellow-icon-2", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryYellowSpinnerCell2, id: "primary-yellow-spinner-2", height: .heightDoubleLineCell),
                        StaticRow(cell: sliderCell, id: "slider", height: 80),
                        StaticRow(cell: sliderDisabledCell, id: "slider-disabled", height: 80),
                        StaticRow(cell: primaryRedCell, id: "primary-red", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryRedIconCell, id: "primary-red-icon", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryGrayCell, id: "primary-gray", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryGrayIconCell, id: "primary-gray-icon", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryTransparentCell, id: "primary-transparent", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryTransparentIconCell, id: "primary-transparent-icon", height: .heightDoubleLineCell),
                        StaticRow(cell: primaryCircleCell, id: "primary-icon", height: .heightDoubleLineCell),
                        StaticRow(cell: secondaryCell, id: "secondary", height: .heightSingleLineCell),
                        StaticRow(cell: secondaryTransparentCell, id: "secondary-transparent", height: .heightSingleLineCell),
                        StaticRow(cell: secondaryTransparent2Cell, id: "secondary-transparent-2", height: .heightSingleLineCell),
                        StaticRow(cell: secondaryFullCell, id: "secondary-full", height: .heightSingleLineCell),
                        StaticRow(cell: secondaryFull2Cell, id: "secondary-full-2", height: .heightSingleLineCell),
                        StaticRow(cell: secondaryCircleCell, id: "secondary-circle", height: .heightSingleLineCell),
                        StaticRow(cell: transparentIconCell, id: "transparent-icon", height: .heightSingleLineCell),
                    ]
            )
        ]
    }

}
