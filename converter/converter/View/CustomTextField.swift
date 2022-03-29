//
//  DataField.swift
//  converter
//
//  Created by Максим Кузнецов on 25.03.2022.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var rigthImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var leftPadding: CGFloat = 4

    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += rightPadding
        return textRect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    func updateView() {
        if let image = rigthImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleToFill
            imageView.image = image
            rightView = imageView
            imageView.tintColor = color
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        let leftSpace = UIView(frame: .zero)
        leftViewMode = UITextField.ViewMode.always
        leftView = leftSpace
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
