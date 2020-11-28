//
//  SinusbotUserResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct SinusbotUser: Decodable {
    let id: String
    var tsuid: String?
    var tsgid: String?
    let locked: Int
    let username: String
    var salt: String?
    var password: String?
    var hash: String?
    var passwordTimestamp: String?
    var created: String?
    var createdBy: String?
    var lastchange: String?
    var lastchangeBy: String?
    let privileges: CLong
    let isAdmin: Int
    var lastLogin: String?
}
