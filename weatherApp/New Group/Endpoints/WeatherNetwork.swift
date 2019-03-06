

import Foundation

enum WeatherService: ServiceEnum {
    case current(city: String,country_code: String)
    case list(city: String,country_code: String)
}

struct WeatherNetworkFactory: Networking {
    typealias EnumType = WeatherService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .current(let city, let country_code):
            
            return WeatherNetwork(city, country_code)
    
        case .list(let city, let coutry_Code):
            return WeatherNetwork(city, coutry_Code)
        }
    }
}

extension WeatherNetworkFactory {
    
    private struct WeatherNetwork: Requestable {
        private var city: String
        private var api_key: String
        private var unit: String
        private var country_code: String
        var method: HTTPMethod = .get
        var path: String = "weather"
        var parameters: [String : Any] {
            return [
                "q": city+","+country_code,
                "appid": api_key,
                "units": unit
            ]
        }
        init(_ city: String, _ country_code: String){
            self.city = city
            self.country_code = country_code
            self.api_key = PersistentData.shared.apiKey.value
            self.unit = PersistentData.shared.unit.value
        }
    }
}


