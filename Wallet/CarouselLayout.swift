import UIKit

final class CarouselLayout: UICollectionViewLayout {
    private var count: Int = 0

    private var x: CGFloat = 0
    private var y: CGFloat = 0
    private var r: CGFloat = 0
    private var θ: CGFloat = 0

    override func prepare() {
        super.prepare()

        // do initial calulation after layout invalidates

        guard let cv = collectionView else { return }

        count = (0..<cv.numberOfSections)
            .reduce(0) { $0 + cv.numberOfItems(inSection: $1) }

        x = cv.bounds.width / 2
        y = cv.bounds.height
        r = (x*x + y*y) / 2 / y
        θ = asin(x / r)
    }

    override var collectionViewContentSize: CGSize {
        return collectionView?.bounds.size ?? .zero
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attr.size = CardView.size
        attr.zIndex = indexPath.row

        let unitAngle = θ * CGFloat(2) / CGFloat(count)
        let angle = unitAngle * (CGFloat(indexPath.row) + 0.5) - θ + CGFloat.pi / 2
        let x = r * cos(angle) + self.x
        let y = -r * sin(angle) + r + self.y / 2
        attr.center = .init(x: x, y: y)

        attr.transform = CGAffineTransform.identity.rotated(by: -angle + CGFloat.pi)

        return attr
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (0..<count).map {
            return layoutAttributesForItem(at: .init(item: $0, section: 0))!
        }
    }
}
