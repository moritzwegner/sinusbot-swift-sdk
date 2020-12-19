//
//  PlaybackSayRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 19.12.20.
//

import Foundation

public struct PlaybackSayRequest: Encodable {
    public let text: String
    public var locale: String?
}
