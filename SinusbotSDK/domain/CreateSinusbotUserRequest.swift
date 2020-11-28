//
//  CreateSinusbotUserRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct CreateSinusbotUserRequest: Encodable {
    public let username: String
    public let password: String
    public let privileges: Int
}
