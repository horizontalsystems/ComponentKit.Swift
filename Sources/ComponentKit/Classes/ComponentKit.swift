import UIKit
import LanguageKit

public class ComponentKit {

    static var bundle: Bundle? {
        Bundle.module
    }

    public static func image(named: String) -> UIImage? {
        UIImage(named: named, in: Bundle.module, compatibleWith: nil)
    }

}

extension String {

    var localized: String {
        LanguageManager.shared.localize(string: self, bundle: ComponentKit.bundle)
    }

    func localized(_ arguments: CVarArg...) -> String {
        LanguageManager.shared.localize(string: self, bundle: ComponentKit.bundle, arguments: arguments)
    }

}
