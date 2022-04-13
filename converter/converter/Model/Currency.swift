import Foundation

struct Currency {
    var name: String
    let cost: Double
}

extension Double {
    var string: String {
        return String(self) + " ₽"
    }
}
