import Foundation

struct Currency {
    let name: String
    let cost: Double
}

extension Double {
    var string: String {
        return String(self) + " ₽"
    }
}
