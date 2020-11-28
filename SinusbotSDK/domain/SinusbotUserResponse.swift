//
//  SinusbotUserResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct SinusbotUserResponse: Decodable {
    public let users: [SinusbotUser]
}
