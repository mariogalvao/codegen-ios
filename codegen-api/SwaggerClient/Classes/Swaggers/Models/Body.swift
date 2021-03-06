//
// Body.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Body: Codable {

    /** Additional data to pass to server */
    public var additionalMetadata: String?
    /** file to upload */
    public var file: Data?

    public init(additionalMetadata: String?, file: Data?) {
        self.additionalMetadata = additionalMetadata
        self.file = file
    }


}

