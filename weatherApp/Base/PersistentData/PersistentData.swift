

import Foundation

private enum Keys: String {
    case baseURL
    case apiKey
    case metric
}

final class PersistentData {
    static let shared = PersistentData()
    private init(){}
    
    var baseURL = Persistent<String>(Keys.baseURL.rawValue)
    var apiKey = Persistent<String>(Keys.apiKey.rawValue)
    var celcius = Persistent<String>(Keys.metric.rawValue)
}
