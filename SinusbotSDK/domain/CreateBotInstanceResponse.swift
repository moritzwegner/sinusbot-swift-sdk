//
//  CreateBotInstanceResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 26.11.20.
//

import Foundation

public struct CreateBotInstanceResponse: Decodable {
    public let success: Bool
    public let uuid: String
}
