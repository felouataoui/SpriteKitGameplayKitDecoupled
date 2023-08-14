import UIKit

extension UIColor
{
    static
    func from(_ color: Color)
    -> UIColor
    {
        return UIColor(
            red: CGFloat(color.r),
            green: CGFloat(color.g),
            blue: CGFloat(color.b),
            alpha: 1)
    }
}
