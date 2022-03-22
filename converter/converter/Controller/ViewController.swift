//
//  ViewController.swift
//  converter
//
//  Created by Максим Кузнецов on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let Arr: [String] = ["AUB", "AUC", "AMM", "AHD", "AUB", "GMC", "AHD", "AUB", "GMC"]
    let Arr2 = ["294.5₽", "294.5₽", "294.5₽", "94.5₽", "294.5₽", "29.5₽", "294.5₽", "294.5₽", "294.5₽"]
    
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
        return Arr.count
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
        cell.layer.cornerRadius = 5
        cell.currencyName.text = Arr[indexPath.item]
        cell.currencyCost.text = Arr2[indexPath.item]
        return cell
    }

    // MARK: Size cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.itemSize(itemsCountInRow: 3, itemOffset: CGFloat(1))

    }
}
