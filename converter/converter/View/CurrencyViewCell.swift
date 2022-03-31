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

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
    }
    
    func insertData(data: Currency) {
        currencyName.text = data.currencyName
        currencyCost.text = data.currenctCost
    }
}
