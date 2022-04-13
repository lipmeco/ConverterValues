import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let itemsCountInRow = 3.0
        static let itemOffest = 7.0
        static let minimumLineSpacingForSection = 8.0
        static let cellIdentifier = "currencyCell"
        static let nibName = "Cell"
    }
    
    let data: [Currency] = [.init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "AMM", cost: 94.5),
                            .init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "AMM", cost: 94.5),
                            .init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "AMM", cost: 94.5),
                            .init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "AMM", cost: 94.5),
                            .init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "AMM", cost: 94.5),
                            .init(name: "AUB", cost: 294.5),
                            .init(name: "AUC", cost: 11.5),
                            .init(name: "MVC", cost: 55.5),
                            .init(name: "MVC", cost: 55.5)]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        let nibCell = UINib(nibName: Constants.nibName, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: Constants.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func insetBetweenViews(parentView: UIView, childView: UICollectionView) -> CGFloat {
        let viewWidth = parentView.frame.size.width
        let collectionWidth = childView.frame.size.width
        let inset = (viewWidth - collectionWidth)
        return inset
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: Count cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    // MARK: Output cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as? CurrencyViewCell
        else {
            return UICollectionViewCell()
        }
        cell.insertData(data: data[indexPath.item])
        return cell
    }

    // MARK: Size cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = view.frame.size.width
        let collectionViewInset = insetBetweenViews(parentView: view, childView: collectionView)
        let widthWithoutSpaces = viewWidth - collectionViewInset
        let width = widthWithoutSpaces / Constants.itemsCountInRow - Constants.itemOffest
        return CGSize(width: width, height: width)
    }
    
    // MARK: Line size between upper and lower cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacingForSection
    }
}
