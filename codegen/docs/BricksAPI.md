# BricksAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBricks**](BricksAPI.md#getbricks) | **GET** /api/v1/channels/{channelId}/users/{userId}/topics/{topicId}/bricks | 


# **getBricks**
```swift
    open class func getBricks(channelId: String, userId: String, topicId: String, limit: Int? = nil, beforeBrickId: String? = nil, completion: @escaping (_ data: [Brick]?, _ error: Error?) -> Void)
```



get Bricks from a Topic

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | channelId
let userId = "userId_example" // String | a user identification
let topicId = "topicId_example" // String | a topic identification
let limit = 987 // Int | limit the results (optional) (default to 50)
let beforeBrickId = "beforeBrickId_example" // String | get brick befor a give brick id (optional)

BricksAPI.getBricks(channelId: channelId, userId: userId, topicId: topicId, limit: limit, beforeBrickId: beforeBrickId) { (response, error) in
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
 **userId** | **String** | a user identification | 
 **topicId** | **String** | a topic identification | 
 **limit** | **Int** | limit the results | [optional] [default to 50]
 **beforeBrickId** | **String** | get brick befor a give brick id | [optional] 

### Return type

[**[Brick]**](Brick.md)

### Authorization

[api_token](../README.md#api_token), [api_secret](../README.md#api_secret)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

