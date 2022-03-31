//
//  ViewController.swift
//  converter
//
//  Created by Максим Кузнецов on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let border = 24
        static let itemsCountInRow = 3
        static let itemOffest = 7
        static let minimumLineSpacingForSection = 8.0
    }

    let data: [Currency] = [.init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "AMM", currenctCost: "94.5₽"),
                            .init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "AMM", currenctCost: "94.5₽"),
                            .init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "AMM", currenctCost: "94.5₽"),
                            .init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "AMM", currenctCost: "94.5₽"),
                            .init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "AMM", currenctCost: "94.5₽"),
                            .init(currencyName: "AUB", currenctCost: "294.5₽"),
                            .init(currencyName: "AUC", currenctCost: "11.5₽"),
                            .init(currencyName: "MVC", currenctCost: "55.5₽"),
                            .init(currencyName: "MVC", currenctCost: "55.5₽")]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "Cell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "currencyCell")
        collectionView.dataSource = self
        collectionView.delegate = self
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
            withReuseIdentifier: "currencyCell",
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
        let widthView = view.frame.size.width
        let widthWithoutSpaces = widthView - (CGFloat(Constants.border + Constants.border))
        let width = widthWithoutSpaces / CGFloat(Constants.itemsCountInRow) - CGFloat(Constants.itemOffest)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.minimumLineSpacingForSection)
    }
}
