//
// Brick.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Brick: Codable, JSONEncodable, Hashable {

    public enum Creator: String, Codable, CaseIterable {
        case ai = "ai"
        case human = "human"
    }
    static let ownerRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    static let topicRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    static let channelRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    static let eventSourceIdRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    static let idRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^[0-9a-fA-F]{24}$/")
    public var creator: Creator = .ai
    public var content: AnyCodable?
    /** Refers to User */
    public var owner: String
    /** Refers to Topic */
    public var topic: String
    /** Refers to Channel */
    public var channel: String
    /** Refers to Event */
    public var eventSourceId: String?
    public var scene: Scene1?
    public var appliedDsgvoDataPrivacyRules: [AnyCodable]?
    public var suggestedOptions: [ItemOfSuggestedOptions1]?
    public var id: String?
    public var updatedAt: Date?
    public var createdAt: Date?

    public init(creator: Creator = .ai, content: AnyCodable? = nil, owner: String, topic: String, channel: String, eventSourceId: String? = nil, scene: Scene1? = nil, appliedDsgvoDataPrivacyRules: [AnyCodable]? = nil, suggestedOptions: [ItemOfSuggestedOptions1]? = nil, id: String? = nil, updatedAt: Date? = nil, createdAt: Date? = nil) {
        self.creator = creator
        self.content = content
        self.owner = owner
        self.topic = topic
        self.channel = channel
        self.eventSourceId = eventSourceId
        self.scene = scene
        self.appliedDsgvoDataPrivacyRules = appliedDsgvoDataPrivacyRules
        self.suggestedOptions = suggestedOptions
        self.id = id
        self.updatedAt = updatedAt
        self.createdAt = createdAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case creator
        case content
        case owner
        case topic
        case channel
        case eventSourceId
        case scene
        case appliedDsgvoDataPrivacyRules
        case suggestedOptions
        case id = "_id"
        case updatedAt
        case createdAt
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(creator, forKey: .creator)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encode(owner, forKey: .owner)
        try container.encode(topic, forKey: .topic)
        try container.encode(channel, forKey: .channel)
        try container.encodeIfPresent(eventSourceId, forKey: .eventSourceId)
        try container.encodeIfPresent(scene, forKey: .scene)
        try container.encodeIfPresent(appliedDsgvoDataPrivacyRules, forKey: .appliedDsgvoDataPrivacyRules)
        try container.encodeIfPresent(suggestedOptions, forKey: .suggestedOptions)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
    }
}

