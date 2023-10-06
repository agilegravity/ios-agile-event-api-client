//
// Scene.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Scene: Codable, JSONEncodable, Hashable {

    public var urlPath: String?

    public init(urlPath: String? = nil) {
        self.urlPath = urlPath
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case urlPath
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(urlPath, forKey: .urlPath)
    }
}
