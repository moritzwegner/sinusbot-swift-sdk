//
//  ConnStatus.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 27.11.20.
//

import Foundation

public struct ConnStatus: Decodable {
    public let status: Int
    public let connectedTime: CLong
    public let latency: Int
    public let packetLoss: Int
    public let packetLossS2C: Int
    public let packetLossC2S: Int
    public let bytesSent: CLong
    public let bytesRecv: CLong
    public let bandwidthSent: Int
    public let bandwidthRecv: Int
    public let channelId: String
}
