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
    let cellCornerRadius: CGFloat = 12
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = cellCornerRadius
    }
    
    func insertData(data: Currency) {
        nameLabel.text = data.name
        costLabel.text = data.cost.string
    }
}
