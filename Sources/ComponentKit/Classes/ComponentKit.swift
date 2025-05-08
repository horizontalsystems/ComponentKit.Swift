import UIKit

public class ComponentKit {
    static var bundle: Bundle? {
        Bundle.module
    }

    public static func image(named: String) -> UIImage? {
        UIImage(named: named, in: Bundle.module, compatibleWith: nil)
    }
}
