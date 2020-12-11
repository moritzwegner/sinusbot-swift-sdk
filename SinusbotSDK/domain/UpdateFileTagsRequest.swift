//
//  UpdateFileTagsRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 11.12.20.
//

import Foundation

public struct UpdateFileTagsRequest: Encodable {
    public var album: String?
    public var artist: String?
    public var bitrate: CLong?
    public var channels: CLong?
    public var codec: String?
    public var displayTitle: String?
    public var duration: CLong?
    public var durationP: String?
    public var filename: String?
    public var filesize: CLong?
    public var genre: String?
    public var parent: String?
    public var samplerate: CLong?
    public var search: String?
    public var title: String?
    public var type: String?
    public var uuid: String?
    public var v: Int?
    public var volume: Int?
}
