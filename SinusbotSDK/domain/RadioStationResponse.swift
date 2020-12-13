//
//  RadioStationResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 13.12.20.
//

import Foundation

public struct RadioStation: Decodable {
    // name of the station
    public var n: String?
    
    // url of the station
    public var u: String?
    
    // genre
    public var g: String?
    
    // bitrate
    public var b: String?
}

public struct RadioStationsResponse: Decodable {
    public var station: [RadioStation]?
}
