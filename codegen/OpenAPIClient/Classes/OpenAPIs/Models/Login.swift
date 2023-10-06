//
// Login.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Login: Codable, JSONEncodable, Hashable {

    public var isAnonym: Bool? = true
    public var passwordLessToken: String?

    public init(isAnonym: Bool? = true, passwordLessToken: String? = nil) {
        self.isAnonym = isAnonym
        self.passwordLessToken = passwordLessToken
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case isAnonym
        case passwordLessToken
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(isAnonym, forKey: .isAnonym)
        try container.encodeIfPresent(passwordLessToken, forKey: .passwordLessToken)
    }
}

