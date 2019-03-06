struct WeatherListResponse: Decodable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [ListWeather]
    let city: City
}


//struct WeatherData: Decodable {
//    let results: [Marvel]?
//}
//
//struct WeatherResponse: Decodable {
//    let data: CharacterData
//}

struct City: Decodable {
    let id: Int
    let name: String
    let coord: CoordList
    let country: String
    let population: Int
}

struct CoordList: Decodable {
    let lat, lon: Double
}

struct ListWeather: Decodable {
    let dt: Int
    let main: MainClass
    let weather: [WeatherListSample]
    let clouds: CloudsList
    let wind: WindList
    let rain: Rain
    let sys: SysList
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, sys
        case dtTxt = "dt_txt"
    }
}

struct CloudsList: Decodable {
    let all: Int
}

struct MainClass: Decodable {
    let temp, tempMin, tempMax, pressure: Double
    let seaLevel, grndLevel: Double
    let humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Rain: Decodable {
    let the3H: Double?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

struct SysList: Decodable {
    let pod: Pod
}

enum Pod: String, Decodable {
    case d = "d"
    case n = "n"
}

struct WeatherListSample: Decodable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: String
}

enum Description: String, Decodable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Decodable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

struct WindList: Decodable {
    let speed, deg: Double
}

