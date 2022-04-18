import Foundation

protocol CacheProtocol {
    func cacheData(for data: Data, key: String)
    func getData(key: String) -> Data?
}
