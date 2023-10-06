//
// SessionAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SessionAPI {

    /**

     - parameter channelId: (path) channelId 
     - parameter sessionBody: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func session(channelId: String, sessionBody: SessionBody, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SessionData?, _ error: Error?) -> Void)) -> RequestTask {
        return sessionWithRequestBuilder(channelId: channelId, sessionBody: sessionBody).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - POST /api/v1/channels/{channelId}/session
     - create or get session relevant ids
     - API Key:
       - type: apiKey Authorization (HEADER)
       - name: api_token
     - parameter channelId: (path) channelId 
     - parameter sessionBody: (body)  
     - returns: RequestBuilder<SessionData> 
     */
    open class func sessionWithRequestBuilder(channelId: String, sessionBody: SessionBody) -> RequestBuilder<SessionData> {
        var localVariablePath = "/api/v1/channels/{channelId}/session"
        let channelIdPreEscape = "\(APIHelper.mapValueToPathItem(channelId))"
        let channelIdPostEscape = channelIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{channelId}", with: channelIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sessionBody)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SessionData>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}