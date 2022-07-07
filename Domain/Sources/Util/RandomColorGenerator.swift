import Foundation
import UIKit

public struct RandomColorGenerator {
    public static func color(except: UIColor? = nil) -> UIColor {
        let systemColors = [
            UIColor.systemRed,
            UIColor.systemBlue,
            UIColor.systemGray,
            UIColor.systemPink,
            UIColor.systemMint,
            UIColor.systemCyan
        ]
        
        let randomColor: UIColor? = {
            if let except = except {
                return systemColors.filter { $0 != except }.randomElement()
            } else {
                return systemColors.randomElement()
            }
        }()
        
        return randomColor ?? .systemGray
    }
}
