import SnapKit
import SwiftUI
import ThemeKit
import UIKit

class MainController: ThemeTabBarController {
    init(selectedIndex: Int = 0) {
        super.init()

        let buttonsTitle = "Buttons"
        let buttonsController = ButtonsController()
        buttonsController.title = buttonsTitle
        buttonsController.tabBarItem = UITabBarItem(title: buttonsTitle, image: UIImage(named: "TabBar Icon"), tag: 0)

        let cellsTitle = "Cells"
        let cellsController = CellsController()
        cellsController.title = cellsTitle
        cellsController.tabBarItem = UITabBarItem(title: cellsTitle, image: UIImage(named: "TabBar Icon"), tag: 0)

        let experimentalTitle = "Experimental"
        let experimentalView = ExperimentalView()
        let experimentalController = UIHostingController(rootView: experimentalView)
        experimentalController.title = experimentalTitle
        experimentalController.tabBarItem = UITabBarItem(title: experimentalTitle, image: UIImage(named: "TabBar Icon"), tag: 0)

        viewControllers = [
            ThemeNavigationController(rootViewController: buttonsController),
            ThemeNavigationController(rootViewController: cellsController),
            ThemeNavigationController(rootViewController: experimentalController),
        ]

        self.selectedIndex = selectedIndex
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
