//
//  AddFolderRequest.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 30.11.20.
//

import Foundation

public struct AddFolderRequest: Encodable {
    public let name: String
    public var parent: String?
}
