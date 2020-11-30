//
//  AddUrlRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 30.11.20.
//

import Foundation

public struct AddUrlRequest: Encodable {
    public let url: String
    public var title: String?
    public var parent: String?
}
