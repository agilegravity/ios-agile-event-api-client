# LoginAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](LoginAPI.md#login) | **POST** /api/v1/channels/{channelId}/login | 


# **login**
```swift
    open class func login(channelId: String, login: Login, apiSecret: String? = nil, completion: @escaping (_ data: Token?, _ error: Error?) -> Void)
```



create loading for user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let channelId = "channelId_example" // String | channelId
let login = Login(isAnonym: false, passwordLessToken: "passwordLessToken_example") // Login | 
let apiSecret = "apiSecret_example" // String | ApiSecret (optional)

LoginAPI.login(channelId: channelId, login: login, apiSecret: apiSecret) { (response, error) in
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
 **login** | [**Login**](Login.md) |  | 
 **apiSecret** | **String** | ApiSecret | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

[api_secret](../README.md#api_secret)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

