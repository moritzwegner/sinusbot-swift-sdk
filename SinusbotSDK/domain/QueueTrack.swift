//
//  QueueTrack.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 13.12.20.
//

import Foundation

public struct QueueTrack: Decodable {
    public var artist: String?
    public var bitrate: Int?
    public var codec: String?
    public var duration: CLong?
    public var filename: String?
    public var filesize: CLong?
    public var parent: String?
    public var path: String?
    public var samplerate: Int?
    public var thumbnail: String?
    public var title: String?
    public var type: String?
    public var uuid: String?
    public var v: Int?
}

public struct QueueTrackListResponse: Decodable {
    public var mediainfo: [QueueTrack]?
}
