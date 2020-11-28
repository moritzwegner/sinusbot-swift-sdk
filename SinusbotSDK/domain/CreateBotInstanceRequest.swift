//
//  CreateBotInstanceRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct CreateBotInstanceRequest: Encodable {
    public let backend: String
    public let nick: String
    
    public init(backend: String, nick: String) {
        self.backend = backend
        self.nick = nick
    }
}
