//
//  EditBotInstanceRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct EditBotInstanceRequest: Encodable {
    public let instanceId: String
    public let nick: String
    public var serverHost: String?
    public var serverPort: Int?
    public var serverPassword: String?
    public var channelName: String?
    public var channelPassword: String?
    public var updateDescription: Bool?
    public var announce: Bool?
    public var announceString: String?
    public var identity: String?
    public var enableDucking: Bool?
    public var duckingVolume: Int?
    public var channelCommander: Bool?
    public var stickToChannel: Bool?
    public var ttsExternalURL: String?
    public var ttsDefaultLocale: String?
    public var ignoreChatServer: Bool?
    public var ignoreChatPrivate: Bool?
    public var ignoreChatChannel: Bool?
    public var idleTrack: String?
    public var startupTrack: String?
}
