

import Foundation

internal enum Endpoint {
    
    case WeatherCurrent(serviceType: WeatherService)
    case WeatherForecast(serviceType: WeatherForeCastService)

}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var jsonString: String { get }
}


extension Requestable {
    var jsonString: String {
        guard let json = json(from: parameters) else { return "" }
        return json
    }
}

internal extension Endpoint {
    func request(with baseURL: URL) -> URLRequest
    {
    
        
        let url = baseURL.appendingPathComponent(properties.path)
        var newParameters = properties.parameters
        properties.parameters.forEach { newParameters.updateValue($1, forKey: $0) }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        if properties.method == .get {
            components.queryItems = newParameters.map { (arg) -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: value as? String)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = properties.method.rawValue
        
        if properties.method == .post {
            var request = URLRequest(url: components.url!)
            request.httpMethod = properties.method.rawValue
            var headers = request.allHTTPHeaderFields ?? [:]
            headers["Content-Type"] = "application/json"
            request.allHTTPHeaderFields = headers
            let jsonString = properties.jsonString
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
        }
        
        return request
    }
}

extension Encodable {
    var json: String? {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(self) else { return nil }
        return String(data: jsonData, encoding: String.Encoding.utf8)
    }
}

func json(from object:Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

private extension Endpoint {
    var properties: Requestable {
        switch self {
        case .WeatherCurrent(let serviceType):
            return WeatherNetworkFactory.getService(from: serviceType)
        case .WeatherForecast(let serviceType):
            return WeatherForeCastNetworkFactory.getService(from: serviceType)

        }
}
}
