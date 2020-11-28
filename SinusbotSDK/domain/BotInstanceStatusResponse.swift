//
//  BotInstanceStatusResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct BotInstanceStatusResponse: Decodable {
    public let v: String
    public var currentTrack: CurrentTrack?
    public let position: CLong
    public let running: Bool
    public let playing: Bool
    public var playlist: String?
    public let playlistTrack: Int
    public let shuffle: Bool
    public let `repeat`: Bool
    public let volume: Int
    public let needsRestart: Bool
    public let queueLen: Int
    public let queueVersion: Int
    public let modes: Int
    public let downloaded: CLong
    public let serverUID: String
    public let flags: Int
    public let muted: Int
    public var connStatus: ConnStatus?
    public let streamListeners: Int
    public var idleTrack: String?
    public var startupTrack: String?
    
}
