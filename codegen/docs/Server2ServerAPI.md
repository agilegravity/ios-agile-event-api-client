# Server2ServerAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**serverToServerProcessEvent**](Server2ServerAPI.md#servertoserverprocessevent) | **POST** /api/v1/channels/{channelId}/events | 


# **serverToServerProcessEvent**
```swift
    open class func serverToServerProcessEvent(channelId: String, serverEvent: [ServerEvent], apiSecret: String? = nil, completion: @escaping (_ data: ServerBrick?, _ error: Error?) -> Void)
```



processes a new Event to be processed by the AI

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | channelId
let serverEvent = [ServerEvent(session: SessionBody(userId: "userId_example", secondaryIds: ["secondaryIds_example"]), events: [Event(eventsource: "eventsource_example", action: "action_example", owner: "owner_example", topic: "topic_example", channel: "channel_example", account: "account_example", project: "project_example", version: "version_example", name: "name_example", payload: payload(eventCategory: "eventCategory_example", eventAction: "eventAction_example", source: "source_example", item: "item_example", actionComponent: "actionComponent_example"), scene: scene(urlPath: "urlPath_example"), content: content(schemaRef: "schemaRef_example", data: 123), scope: "scope_example", tpKey: "tpKey_example", options: 123, text: "text_example", suggestedOptions: [itemOf_suggestedOptions(id: "id_example", name: "name_example", event: "event_example", dataStoreTransactions: dataStoreTransactions(add: [itemOf_add(key: "key_example", value: "value_example", path: "path_example", ttl: ttl(amount: 123, unit: "unit_example"), source: "source_example", id: "id_example")], remove: [itemOf_remove(key: "key_example", value: "value_example", path: "path_example", ttl: nil, source: "source_example", id: "id_example")]), microIntends: [123], triggedByMicroIntends: [123], content: nil, feedback: feedback(poolId: "poolId_example", id: "id_example", dims: ["dims_example"], value: 123, _class: "_class_example", id: "id_example"))], nodeItemSourceId: "nodeItemSourceId_example", id: "id_example", createdAt: Date(), updatedAt: Date())])] // [ServerEvent] | 
let apiSecret = "apiSecret_example" // String | ApiSecret (optional)

Server2ServerAPI.serverToServerProcessEvent(channelId: channelId, serverEvent: serverEvent, apiSecret: apiSecret) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **channelId** | **String** | channelId | 
 **serverEvent** | [**[ServerEvent]**](ServerEvent.md) |  | 
 **apiSecret** | **String** | ApiSecret | [optional] 

### Return type

[**ServerBrick**](ServerBrick.md)

### Authorization

[api_token](../README.md#api_token), [api_secret](../README.md#api_secret)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

