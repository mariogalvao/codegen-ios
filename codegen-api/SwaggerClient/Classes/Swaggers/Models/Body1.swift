//
// Body1.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Body1: Codable {

    /** Updated name of the pet */
    public var name: String?
    /** Updated status of the pet */
    public var status: String?

    public init(name: String?, status: String?) {
        self.name = name
        self.status = status
    }


}

