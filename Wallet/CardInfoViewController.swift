import UIKit

// Card pic

// Spending summary

// Transaction detail (by month?)

final class CardInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

//        let cardView = CardView.loadFromNib()
//        view.addSubview(cardView)
//        cardView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 2)
//        cardView.center = view.center

        let frame = CGRect(origin: .zero, size: .init(width: view.frame.width, height: 320))
        let layout = CarouselLayout()
//        let layout = UICollectionViewFlowLayout() // CarouselLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = .init(width: 320, height: 180)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: CardCollectionViewCell.self)
        collectionView.center = view.center
        view.addSubview(collectionView)
    }
}

extension CardInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCollectionViewCell.self)
        return cell
    }
}

extension CardInfoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
