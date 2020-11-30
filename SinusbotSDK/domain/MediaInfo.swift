//
//  MediaInfo.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 30.11.20.
//

import Foundation

public struct MediaInfo: Decodable {
    let uuid: String
    let parent: String
    let type: String
    var mimeType: String?
    var title: String?
    var artist: String?
    var tempTitle: String?
    var tempArtist: String?
    var album: String?
    var albumArtist: String?
    var track: Int?
    var totalTracks: Int?
    var copyright: String?
    var genre: String?
    var thumbnail: String?
    var codec: String?
    var duration: Int?
    var bitrate: Int?
    var channels: Int?
    var samplerate: Int?
    var filesize: Int?
    
}
