//
//  UpdateUserRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 19.12.20.
//

import Foundation

public struct UpdateUserRequest: Encodable {
    public var password: String?
    public var tsuid: String?
    public var tsgid: String?
    public var privileges: Int?
}
