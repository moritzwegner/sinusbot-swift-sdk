//
//  LoginResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct LoginResponse: Decodable {
    public let token: String
    public let botId: String
}
