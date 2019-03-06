

import Foundation

enum WeatherService: ServiceEnum {
    case current(city: String)
}

struct WeatherNetworkFactory: Networking {
    typealias EnumType = WeatherService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .current(let city):
            return WeatherNetwork(city)
    
        }
    }
}

extension WeatherNetworkFactory {
    
    private struct WeatherNetwork: Requestable {
        private var city: String
        private var api_key: String
        private var metric: String
        var method: HTTPMethod = .get
        var path: String = ""
        var parameters: [String : Any] {
            return [
                "q": city,
                "appid": api_key,
                "units": metric
            ]
        }
        
        init(_ city: String){
            self.city = city
            self.api_key = PersistentData.shared.apiKey.value
            self.metric = PersistentData.shared.celcius.value
        }
    }
}


