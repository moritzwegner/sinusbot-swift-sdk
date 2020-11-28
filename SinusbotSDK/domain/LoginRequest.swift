//
//  LoginRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct LoginRequest: Encodable {
    let username: String
    let password: String
    let botId: String
}
