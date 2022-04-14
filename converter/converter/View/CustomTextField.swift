//
//  DataField.swift
//  converter
//
//  Created by Максим Кузнецов on 25.03.2022.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    private enum Constants {
        static let dateFormat = "dd.MM.yyyy"
    }
    
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
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        return dateFormatter
    }()
    
    var tapHandled: (() -> Void)?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        tapHandled?()
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
    
    func setText(date: Date) {
        self.text = dateFormatter.string(from: date)
    }
    
    func updateView() {
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        
        if let image = rigthImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleToFill
            imageView.image = image
            rightView = imageView
            imageView.tintColor = color
        }
        
        let leftSpace = UIView(frame: .zero)
        leftViewMode = UITextField.ViewMode.always
        leftView = leftSpace
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
