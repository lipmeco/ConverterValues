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
        
    func setCornerRadius(cornerRadius: CGFloat = 12) {
        self.layer.cornerRadius = cornerRadius
    }
        
    func insertData(data: Currency) {
        currencyName.text = data.currencyName
        currencyCost.text = data.currenctCost
    }
}
