//
//  TeamspeakChannel.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct TeamspeakChannel: Decodable {
    public var clients: [TeamspeakClient]?
    public let codec: Int
    public let `default`: Int
    public let enc: Int
    public let id: Int
    public let maxClients: Int
    public let name: String
    public let order: Int
    public let parent: Int
    public let perm: Int
    public let pw: Int
    public let quality: Int
    public let sperm: Int
    public var topic: String?
    public let unlimited: Bool?
}

public struct TeamspeakClient: Decodable {
    public let away: Int
    public let dbid: Int
    public var g: [G]?
    public let id: Int
    public let idle: CLong
    public let inputMuted: Int
    public let ko: Int
    public let nick: String
    public let outputMuted: Int
    public let outputOnlyMuted: Int
    public let recording: Int
    public let uid: String
}

public struct G: Decodable {
    public let i: Int
    public let id: String
    public let n: String
    public let name: String
}
