import SnapKit
import UIKit

final class CardCollectionViewCell: UICollectionViewCell, NibReusable {
    private var cardView: CardView!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView = .loadFromNib()
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
