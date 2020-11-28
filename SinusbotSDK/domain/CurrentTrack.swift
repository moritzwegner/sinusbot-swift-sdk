//
//  CurrentTrack.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct CurrentTrack: Decodable {
    public let v: String
    public let uuid: String
    public var parent: String?
    public let type: String
    public let filename: String
    public let title: String
    public let tempArtist: String
    public let temTitle: String?
}
