//
//  ScriptListResponse.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 13.12.20.
//

import Foundation

public struct Script: Decodable {
    public var author: String?
    public var backends: [String]?
    public var date: Int?
    public var description: String?
    public var engine: String?
    public var name: String?
    public var offset: Int?
    public var requiredModules: [String]?
    public var vars: [Var]?
    public var version: String?
}

public struct Var: Decodable {
    public var name: String?
    public var placeholder: String?
    public var title: String?
    public var type: String?
    public var options: [String]?
}

public struct ScriptListResponse: Decodable {
    public var scriptname: [Script]?
}
