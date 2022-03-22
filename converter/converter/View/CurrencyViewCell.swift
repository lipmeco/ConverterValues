//
//  CurrencyViewCell.swift
//  converter
//
//  Created by Максим Кузнецов on 20.03.2022.
//

import UIKit

class CurrencyViewCell: UICollectionViewCell {
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyCost: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("Cell", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
