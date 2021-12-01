import UIKit
import ThemeKit
import SnapKit

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
        cellsController.tabBarItem = UITabBarItem(title: cellsTitle, image: UIImage(named: "TabBar Icon"), tag: 3)

        viewControllers = [
            ThemeNavigationController(rootViewController: buttonsController),
            ThemeNavigationController(rootViewController: cellsController),
        ]

        self.selectedIndex = selectedIndex
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
