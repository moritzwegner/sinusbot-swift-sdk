//
//  BotInstanceLogResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct BotInstanceLogResponse: Decodable {
    public let entries: [BotInstanceLog]
}
