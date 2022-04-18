import UIKit

class CurrencyDetailView: UIViewController {
    
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var charCodeLabel: UILabel!
    @IBOutlet weak var rublesTextField: CustomTextFieldDetailScreen!
    
    var data: DetailScreenViewDataProtocol?
    
    private enum Constants {
        static let bottomViewCornerRadius = 17.0
        static let countAfterDot = 2
    }
    
    @IBAction func currencyChanged(_ sender: UITextField) {
        guard
            let data = data,
            let stringCost = sender.text
        else {
            return
        }
        
        rublesTextField.text = nil
        if let cost = Double(stringCost) {
            let price = (cost * data.value)
                .rounded(toPlaces: Constants.countAfterDot)
            
            rublesTextField.text = String(price)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.layer.cornerRadius = Constants.bottomViewCornerRadius
        setNavItem()
        setInfoCurrencies()
    }
    
    private func setNavItem() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: nil,
            action: nil
        )
        title = data?.charCode
    }
    
    private func setInfoCurrencies() {
        self.valueLabel.text = data?.value.rounded(toPlaces: Constants.countAfterDot).rubString
        self.nameLabel.text = data?.name
        self.charCodeLabel.text = data?.charCode
    }
}

