

import Foundation

private enum Keys: String {
    case baseURL
    
}

final class PersistentData {
    static let shared = PersistentData()
    private init(){}
    
    var baseURL = Persistent<String>(Keys.baseURL.rawValue)
  
}
