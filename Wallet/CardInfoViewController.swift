import UIKit

// Card pic

// Spending summary

// Transaction detail (by month?)

final class CardInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(origin: .zero, size: .init(width: view.frame.width, height: 400))
        let layout = CarouselLayout()
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
        return 7
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
