import Foundation

protocol CachProtocol {
    func cacheData(for data: Data, key: String)
    func getData(key: String) -> Data?
}
