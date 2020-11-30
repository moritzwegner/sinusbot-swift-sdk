//
//  FileListResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 30.11.20.
//

import Foundation

public struct FileListResponse: Decodable {
    public var mediaInfo: [MediaInfo]?
}
