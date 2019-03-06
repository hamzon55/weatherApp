

import Foundation


struct WeatherListResponse: Codable {
    
    var resultCount: Int?
    let results: [WeatherResultsList]?
    
}
struct WeatherResultsList: Codable {
    
    let wrapperType, kind, artistName, collectionName, trackName, primaryGenreName: String?
    let trackPrice: Float?
    let releaseDate: String?
    let currency: String?
    let artworkUrl100: String?
    let previewUrl: String?
    let trackTimeMillis: Int?
}

