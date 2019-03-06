


import Foundation

enum WeatherForeCastService: ServiceEnum {
    case list(city: String,country_code: String)
}

struct WeatherForeCastNetworkFactory: Networking {
    typealias EnumType = WeatherForeCastService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .list(let city, let coutry_Code):
            return WeatherForeCastNetwork(city, coutry_Code)
        }
    }
}

extension WeatherForeCastNetworkFactory {
    
    private struct WeatherForeCastNetwork: Requestable {
        private var city: String
        private var api_key: String
        private var unit: String
        private var country_code: String
        var method: HTTPMethod = .get
        var path: String = "forecast"
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
            self.unit  = PersistentData.shared.unit.value
        }
    }
    
    
    
}


