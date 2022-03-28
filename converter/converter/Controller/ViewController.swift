//
//  ViewController.swift
//  converter
//
//  Created by Максим Кузнецов on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    let Arr = ["AUB", "AUC", "AMM", "AHD", "AUB", "GMC", "AHD", "AUB", "GMC", "AUB", "AUC", "AMM", "AHD", "AUB", "GMC", "AHD", "AUB", "GMC"]

    let Arr2 = ["294.5₽", "11.5₽", "294.5₽", "94.5₽", "294.5₽", "29.5₽", "45.5₽", "294.5₽", "294.5₽", "294.5₽", "11.5₽", "294.5₽", "94.5₽", "294.5₽", "29.5₽", "45.5₽", "294.5₽", "294.5₽"]
    
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
        return min(Arr.count, Arr2.count)
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
        cell.layer.cornerRadius = 12
        let labelName = Arr[indexPath.item]
        let labelCost = Arr2[indexPath.item]
        let cellData = Currency(currencyName: labelName, currenctCost: labelCost)
        cell.insertData(data: cellData)
        return cell
    }

    // MARK: Size cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.itemSize(itemsCountInRow: 3, itemOffset: CGFloat(1))

    }
}
