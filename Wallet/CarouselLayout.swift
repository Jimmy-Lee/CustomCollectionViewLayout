import UIKit

final class CarouselLayout: UICollectionViewLayout {
    private var count: Int = 0
    private lazy var radian: CGFloat = { 2 * CGFloat.pi / CGFloat(count) }()
    private lazy var radius: CGFloat = { CardView.size.width * 1.5 }()

    override func prepare() {
        super.prepare()

        // do initial calulation after layout invalidates

        guard let cv = collectionView else { return }

        count = (0..<cv.numberOfSections)
            .reduce(0) { $0 + cv.numberOfItems(inSection: $1) }
    }

    override var collectionViewContentSize: CGSize {
        return .init(width: radius * 2, height: radius * 2)
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attr.size = CardView.size
        let angle = radian * CGFloat(indexPath.row)
        let x: CGFloat = (radius - CardView.size.width / 2) * cos(angle) + collectionViewContentSize.width / 2
        let y: CGFloat = (radius - CardView.size.width / 2) * sin(angle) + collectionViewContentSize.height / 2
        attr.center = .init(x: x, y: y)
        attr.transform = CGAffineTransform.identity.rotated(by: radian * CGFloat(indexPath.row))
        attr.zIndex = indexPath.row

        return attr
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (0..<count).map {
            return layoutAttributesForItem(at: .init(item: $0, section: 0))!
        }
    }
}
