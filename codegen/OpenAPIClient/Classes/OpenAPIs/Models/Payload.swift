//
// Payload.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Payload: Codable, JSONEncodable, Hashable {

    public var eventCategory: String
    public var eventAction: String
    public var source: String?
    public var item: String?
    public var actionComponent: String?

    public init(eventCategory: String, eventAction: String, source: String? = nil, item: String? = nil, actionComponent: String? = nil) {
        self.eventCategory = eventCategory
        self.eventAction = eventAction
        self.source = source
        self.item = item
        self.actionComponent = actionComponent
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case eventCategory
        case eventAction
        case source
        case item
        case actionComponent
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(eventCategory, forKey: .eventCategory)
        try container.encode(eventAction, forKey: .eventAction)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(actionComponent, forKey: .actionComponent)
    }
}

