### README for Agile AI Event AI SDK

# Agile AI Event AI SDK

Agile AI Event AI SDK provides a simplified way to integrate agilegravity's event API into your iOS applications. It helps developers manage authentication and sessions, facilitating efficient and secure access to the event API.

## Installation

### Prerequisites

- iOS 11.0+
- Xcode 11+
- Swift 5.1+

Include `EventApiClient.swift` into your project to access the functionalities provided by the SDK.

## Usage

### Initialization

Initialize `APIClient` with your `channelId`, `apiSecret`, and optionally a custom `baseUrl`.

```swift
let apiClient = APIClient(channelId: "yourChannelId", apiSecret: "yourApiSecret")
```

### Authentication

The SDK ensures users are authenticated before making requests to the event API. The authentication process is handled internally, so developers don't need to manage it manually.

### Sessions

Similar to authentication, session management is also handled within the SDK. It ensures that a session is active and valid before proceeding with API requests.

### Fetching Event Data

Use the `eventAPICall` function to fetch event data. Provide an array of `EventBody` and a completion handler to process the response.

```swift
let eventBody = EventBody(name: "eventName", text: "eventText", payload: nil)
apiClient.eventAPICall(event: [eventBody]) { bricks, error in
    if let error = error {
        print("Error:", error)
        return
    }

    if let bricks = bricks {
        print("Fetched Bricks:", bricks)
    }
}
```

`Brick` data returned from the event API is a mix of structured data and custom use-case payloads. The `content.data` field contains the custom use-case payload, and `content.schemaRef` provides information on the type of data contained within it.

### Error Handling

Errors are returned via the completion handlers, providing an opportunity to handle API and network-related errors gracefully within your application.

## Contributing

Feel free to contribute to the development of this SDK. Open an issue or submit pull requests.


---

**Note:** Replace placeholders like `"yourChannelId"` and `"yourApiSecret"` with your actual `channelId` and `apiSecret`. Also, handle the received `bricks` and `error` as per your application's requirements.

### For Contributors and Developers

This SDK is designed to be straightforward and easily integrated into iOS applications. It handles complex tasks like authentication and session management internally, allowing developers to focus on utilizing the event data returned by the API. We encourage contributions to make this tool more efficient and versatile, catering to a broader range of use cases and scenarios.