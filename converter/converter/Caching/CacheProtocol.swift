import Foundation

protocol CacheProtocol {
    func cacheData(data: Data, key: String)
    func getData(key: String) -> Data?
}
