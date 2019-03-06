

import Foundation

enum WeatherService: ServiceEnum {
    case list(term: String)
}

struct WeatherNetworkFactory: Networking {
    typealias EnumType = WeatherService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .list(let term):
            return WeatherNetwork(term)
    
        }
    }
}

extension WeatherNetworkFactory {
    
    private struct WeatherNetwork: Requestable {
        private var term: String
        var method: HTTPMethod = .get
        var path: String = ""
        var parameters: [String : Any] {
            return [
                "term": "\(term)"
            ]
        }
        
        init(_ term: String){
           self.term = term
        }
    }
}


