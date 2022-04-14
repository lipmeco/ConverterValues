import Foundation

struct Currency {
    var name: String
    var cost: Double
}

extension Double {
    var string: String {
        return String(self) + " ₽"
    }
}
