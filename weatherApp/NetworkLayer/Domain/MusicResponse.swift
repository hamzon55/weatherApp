//
//  MusicResponse.swift
//  viperProject
//
//  Created by Hamza Jerbi on 21/01/2019.
//  Copyright © 2019 Hamza Jerbi. All rights reserved.
//

import Foundation


struct MusictListResponse: Codable {
    let resultCode: Int?
    let appointmentList: [MusicResultList]?
}

struct MusicResultList: Codable {
    let wrapperType, Kind, artistName, collectionName, trackName: String?
    let trackPrice: Double?
    let artworkUrl100: String
    let trackTimeMillis: Int?
}
