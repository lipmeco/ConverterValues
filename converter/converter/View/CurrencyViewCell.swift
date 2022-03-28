//
//  CurrencyViewCell.swift
//  converter
//
//  Created by Максим Кузнецов on 20.03.2022.
//

import UIKit

class CurrencyViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var currencyName: UILabel!
    @IBOutlet private weak var currencyCost: UILabel!

    private(set) var data: Currency?

    func insertData(data: Currency) {
        self.data = data
        currencyName.text = data.currencyName
        currencyCost.text = data.currenctCost
    }
}
