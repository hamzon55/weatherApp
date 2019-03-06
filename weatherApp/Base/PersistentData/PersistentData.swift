

import Foundation

private enum Keys: String {
    case baseURL
    case apiKey
    case metric
    case forectast
    
}

final class PersistentData {
    static let shared = PersistentData()
    private init(){}
    
    var baseURL = Persistent<String>(Keys.baseURL.rawValue)
    var apiKey = Persistent<String>(Keys.apiKey.rawValue)
    var unit = Persistent<String>(Keys.metric.rawValue)
    var forecastURL = Persistent<String>(Keys.forectast.rawValue)
}
