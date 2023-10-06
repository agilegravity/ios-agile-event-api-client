# OpenApiJsonAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getChannelOpenApiJson**](OpenApiJsonAPI.md#getchannelopenapijson) | **GET** /api/v1/channels/{channelId}/openapi.json | 


# **getChannelOpenApiJson**
```swift
    open class func getChannelOpenApiJson(channelId: String, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```



get the swagger json with replaced json schema values

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | channelId

OpenApiJsonAPI.getChannelOpenApiJson(channelId: channelId) { (response, error) in
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

### Return type

**AnyCodable**

### Authorization

[api_token](../README.md#api_token), [api_secret](../README.md#api_secret)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

