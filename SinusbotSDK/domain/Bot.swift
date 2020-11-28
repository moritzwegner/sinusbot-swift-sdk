//
//  Bot.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct Bot: Decodable {
    public let id: String
    public var alias: String?
    public let spaceUsed: String
    public let limitSpace: Int
    public let limitFiles: Int
    public let limitPlaylists: Int
    public let limitInstances: Int
    public let limitUsers: Int
    public let limitDownloadRate: Int
    public let limitDownloadSize: Int
    public let locked: Int
    public let deleted: Int
    public let disallowDownload: Int
    public let disallowStreaming: Int
    public let downloadedBytes: CLong
    public let statHTTPRequests: Int
    public let statPlayCount: Int
    public let statCommandCount: Int
    public let allowedBackends: [String]
    public let disallowRegistration: Bool
}
