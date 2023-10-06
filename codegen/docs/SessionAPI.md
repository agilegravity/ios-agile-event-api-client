# SessionAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**session**](SessionAPI.md#session) | **POST** /api/v1/channels/{channelId}/session | 


# **session**
```swift
    open class func session(channelId: String, sessionBody: SessionBody, completion: @escaping (_ data: SessionData?, _ error: Error?) -> Void)
```



create or get session relevant ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | channelId
let sessionBody = SessionBody(userId: "userId_example", secondaryIds: ["secondaryIds_example"]) // SessionBody | 

SessionAPI.session(channelId: channelId, sessionBody: sessionBody) { (response, error) in
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
 **sessionBody** | [**SessionBody**](SessionBody.md) |  | 

### Return type

[**SessionData**](SessionData.md)

### Authorization

[api_token](../README.md#api_token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

