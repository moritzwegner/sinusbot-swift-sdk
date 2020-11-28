//
//  BotInstanceResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct BotInstanceResponse: Decodable {
    public let backend: String
    public let uuid: String
    public let name: String
    public let nick: String
    public let running: Bool
    public let playing: Bool
    public let mainInstance: Bool
    public let licenseId: String
    public let serverHost: String
    public let serverPort: Int
    public var privileges:Privileges?
}

public struct Privileges: Decodable {
    
}
