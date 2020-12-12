//
//  DownloadJob.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 12.12.20.
//

import Foundation

public struct DownloadJob: Decodable {
    public var bw: String?
    public let done: Bool
    public var eta: String?
    public var msg: String?
    public var perc: String?
    public let play: Bool
    public let queue: Bool
    public var size: String?
    public var status: String?
    public let temp: Bool
    public var trackuuid: String?
    public var url: String?
    public var uuid: String?
}
