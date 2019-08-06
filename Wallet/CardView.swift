import UIKit

final class CardView: UIView, NibReusable {
    static var size: CGSize {
        return .init(width: 320, height: 180)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
