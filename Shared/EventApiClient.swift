//
//  EventApiClient.swift
//  agile-ai-event-ai
//
//  Created by Benedikt Weiner on 07.10.23.
//

import Foundation

class APIClient {
    private var BASE_URL: String
    private var access_token: String?

    private var channelId: String
    private var apiSecret: String

    private var userId: String?
    private var topicId: String?

    init(channelId: String, apiSecret: String, baseUrl: String? =  "https://dev-agile-v3-agile-bai-event.agilegravity.com") {
        self.BASE_URL = baseUrl ?? "https://dev-agile-v3-agile-bai-event.agilegravity.com"
        self.channelId = channelId
        self.apiSecret = apiSecret
    }


    struct Login: Codable {
        var isAnonym: Bool
    }
    struct Token: Codable {
        var access_token: String
        var token_type: String
        var expires_in: Double
        var userID: String?
        var channelId: String
    }

    private func ensureLogin(completion: @escaping () -> Void) {
        if access_token != nil {
            completion()
            return
        }

        loginAPICall( completion:  { data, error in
            guard let data = data, error == nil else {
                print("Error sending request:", error ?? "No error")
                return
            }
            self.access_token = data.access_token
            self.userId = data.userID
            completion()
        })
    }

    func loginAPICall( completion: @escaping (Token?, Error?) -> Void) {
        let url = URL(string: "\(self.BASE_URL)/api/v1/channels/\(self.channelId)/login")!

        let post = Login(isAnonym: true)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(self.apiSecret, forHTTPHeaderField: "ApiSecret")

        do {
            let jsonData = try JSONEncoder().encode(post)
            request.httpBody = jsonData
        } catch {
            print("Error encoding post object:", error)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data is nil"]))
                return
            }
            do {

                let token = try JSONDecoder().decode(Token.self, from: data)


                completion(token, nil)

            } catch {
                print("Error parsing response: \(error)")
                return
            }
        }

        task.resume()
    }

    struct Session: Codable {
        var userId: String
    }

    struct SessionResponse : Codable {
        var userId: String
        var topicId: String
    }

    private func ensureLSession(completion: @escaping () -> Void) {
        if topicId != nil {
            completion()
            return
        }

        sessionAPICall( completion:  { data, error in
            guard let data = data, error == nil else {
                print("Error sending request:", error ?? "No error")
                return
            }
            self.topicId = data.topicId
            completion()
        })
    }

    func sessionAPICall( completion: @escaping (SessionResponse?, Error?) -> Void) {
        ensureLogin {
            let url = URL(string: "\(self.BASE_URL)/api/v1/channels/\(self.channelId)/session")!

            let post = Session(userId: self.userId!)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(self.apiSecret, forHTTPHeaderField: "ApiSecret")
            request.setValue(self.access_token, forHTTPHeaderField: "Authorization")


            do {
                let jsonData = try JSONEncoder().encode(post)
                request.httpBody = jsonData
            } catch {
                print("Error encoding post object:", error)
                return
            }

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data is nil"]))
                    return
                }

                do {

                    let sessionResp = try JSONDecoder().decode(SessionResponse.self, from: data)

                    print("sessoin response", data)
                    completion(sessionResp, nil)
                } catch {
                    print("Error parsing response: \(error)")
                    return
                }

            }

            task.resume()
        }
    }






    struct EventPayload  : Codable {
        var eventCategory: String
        var eventAction: String
        var source: String
    }
    struct EventBody : Codable {
        var name: String
        var text: String
        var payload: EventPayload?
    }
    enum JSONValue: Decodable {
        case string(String)
        case int(Int)
        case double(Double)
        case bool(Bool)
        case object([String: JSONValue])
        case array([JSONValue])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let string = try? container.decode(String.self) {
                self = .string(string)
                return
            }

            if let int = try? container.decode(Int.self) {
                self = .int(int)
                return
            }

            if let double = try? container.decode(Double.self) {
                self = .double(double)
                return
            }

            if let bool = try? container.decode(Bool.self) {
                self = .bool(bool)
                return
            }

            if let object = try? container.decode([String: JSONValue].self) {
                self = .object(object)
                return
            }

            if let array = try? container.decode([JSONValue].self) {
                self = .array(array)
                return
            }

            throw DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Mismatched Types"))
        }
    }

    struct Brick: Decodable, Hashable, Equatable  {
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        static func ==(lhs: Brick, rhs: Brick) -> Bool {
            return lhs.id == rhs.id
        }

        let creator: String
        let content: Content
        let eventsource: String
        let trackingUrlParams: [String]
        let owner: String
        let topic: String
        let channel: String
        let appliedDsgvoDataPrivacyRules: [String]
        let id: String
       let suggestedOptions: [SuggestedOption]
        let v: Int
        let createdAt: String
        let updatedAt: String

        enum CodingKeys: String, CodingKey {
            case creator, content, eventsource, trackingUrlParams, owner, topic, channel, appliedDsgvoDataPrivacyRules
            case id = "_id"
            case suggestedOptions
            case v = "__v"
            case createdAt, updatedAt
        }

        struct Content: Decodable {
            let schemaRef: String
            let data: JSONValue
        }

        struct DataContent: Decodable {
            let role: String?
            let content: String?
            let text: String?
        }
    }
    struct SuggestedOption: Decodable {
        let data: JSONValue
        let dataStoreTransactions: DataStoreTransactions
        let scoringKeys: [String]
        let content: OptionContent

        let produceEvent: ProduceEvent
        let id: String
        let microIntends: [String]
        let triggedByMicroIntends: [String]
        let removeFromAgilePoolRules: [String]

        enum CodingKeys: String, CodingKey {
            case data, dataStoreTransactions, scoringKeys, content, produceEvent
            case id = "_id"
            case microIntends, triggedByMicroIntends, removeFromAgilePoolRules
        }
        struct OptionContent: Decodable {
            let schemaRef: String
            let data: JSONValue
        }

        struct DataStoreTransactions: Decodable {
            let add: [String]
            let remove: [String]
        }
        struct ProduceEvent: Decodable {
            let dataStoreTransactions: DataStoreTransactions
        }
    }




    func eventAPICall( event: [EventBody], completion: @escaping ([Brick]?, Error?) -> Void) {
        ensureLSession {

            let url = URL(string: "\(self.BASE_URL)/api/v1/channels/\(self.channelId)/users/\(self.userId!)/topics/\(self.topicId!)/events")!

            let post = event
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(self.apiSecret, forHTTPHeaderField: "ApiSecret")
            request.setValue(self.access_token, forHTTPHeaderField: "Authorization")

            do {
                let jsonData = try JSONEncoder().encode(post)
                request.httpBody = jsonData
            } catch {
                print("Error encoding post object:", error)
                return
            }

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data is nil"]))
                    return
                }
                do {
                    let brickResp = try JSONDecoder().decode([Brick].self, from: data)

                    completion(brickResp, nil)
                } catch {
                    print("Error parsing response: \(error)")
                    return
                }

            }

            task.resume()
        }
    }


}
