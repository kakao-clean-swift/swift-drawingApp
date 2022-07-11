import UIKit

extension UIColor {
    static var randomSystemColor: UIColor {
        let colors: [UIColor] = [
            .systemBlue, .systemGray, .systemPink, .systemOrange, .systemYellow, .systemBrown, .systemIndigo
        ]
        return colors.randomElement() ?? .systemPink
    }
}
