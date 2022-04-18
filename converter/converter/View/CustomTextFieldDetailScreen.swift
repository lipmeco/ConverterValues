//
//  CustomTextFieldDetailScreen.swift
//  converter
//
//  Created by Максим Кузнецов on 17.04.2022.
//

import UIKit

class CustomTextFieldDetailScreen: UITextField {
    
    private enum Constants {
        static let heighBottomLine = 0.5
    }
    
    override func awakeFromNib() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: .zero,
                                  y: self.frame.size.height,
                                  width: self.frame.size.width,
                                  height: Constants.heighBottomLine)
        bottomLine.backgroundColor = UIColor(named: "bottomLineDetailScreen")?.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
