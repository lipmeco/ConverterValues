//
//  CurrencyViewCell.swift
//  converter
//
//  Created by Максим Кузнецов on 20.03.2022.
//

import UIKit

class CurrencyViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var costLabel: UILabel!
    
    private enum Constants {
        static let cellCornerRadius = 12.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = Constants.cellCornerRadius
    }
    
    func insertData(data: Currency) {
        nameLabel.text = data.name
        costLabel.text = data.cost.string
    }
}
