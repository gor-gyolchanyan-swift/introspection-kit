//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import Foundation

internal struct Example {

    // MARK: - Example

    internal var first: NSString?
    internal weak var second: NSMutableString?
    internal unowned(safe) let third: NSAttributedString?
    internal unowned(unsafe) let fourth: NSMutableAttributedString?
}
