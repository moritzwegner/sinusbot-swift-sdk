//
//  AddDownloadJobResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 12.12.20.
//

import Foundation

public struct AddDownloadJobResponse: Decodable {
    public let success: Bool
    public let uuid: String
}
