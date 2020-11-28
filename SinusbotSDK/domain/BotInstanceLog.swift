//
//  BotInstanceLog.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct BotInstanceLog: Decodable {
    // message
    public let m: String
    // severity
    public let s: Int
    // time
    public let t: Int
}
