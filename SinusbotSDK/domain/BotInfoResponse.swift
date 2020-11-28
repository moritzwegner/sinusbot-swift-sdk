//
//  BotInfoResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct BotInfoResponse: Decodable {
    public let bot: Bot
    public let system: System
    public let usageMemory: Float
}

public struct System: Decodable {
    public let codecs: [String]
    public let formats: [String]
}
