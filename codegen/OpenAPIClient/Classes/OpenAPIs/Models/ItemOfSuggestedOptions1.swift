//
// ItemOfSuggestedOptions1.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ItemOfSuggestedOptions1: Codable, JSONEncodable, Hashable {

    static let nodeItemSourceIdRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    static let idRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    public var name: String?
    public var groupId: String?
    public var content: Content?
    /** Refers to NodeItem */
    public var nodeItemSourceId: String?
    public var id: String?

    public init(name: String? = nil, groupId: String? = nil, content: Content? = nil, nodeItemSourceId: String? = nil, id: String? = nil) {
        self.name = name
        self.groupId = groupId
        self.content = content
        self.nodeItemSourceId = nodeItemSourceId
        self.id = id
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case groupId
        case content
        case nodeItemSourceId
        case id = "_id"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(groupId, forKey: .groupId)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(nodeItemSourceId, forKey: .nodeItemSourceId)
        try container.encodeIfPresent(id, forKey: .id)
    }
}

