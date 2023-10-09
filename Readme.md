# EventApiClient

The EventApiClient is a Swift client, designed for the seamless and secure integration of the agilegravity event API into iOS applications. It encapsulates the Login and Session and provides the event Api call functionality

git url: https://github.com/agilegravity/ios-agile-event-api-client


## Key Features of EventApiClient:

* Authentication Management:
The client skillfully encapsulates the Login and Session APIs. It ensures that all interactions with the event API are authenticated, promoting a secure user experience and data integrity.
* Ease of Integration:
EventApiClient is designed with simplicity and effectiveness in mind. Its architecture allows for straightforward integration, making it a developer-friendly tool for incorporating the agilegravity event API into iOS applications.
* Foundational Work:
While this is a proof of concept, it serves as a significant stepping stone for future developments and enhancements. It provides insights and a practical perspective on the potential and efficiency of integrating the event API.


As we proceed with the development, we are committed to refining and enhancing EventApiClient to meet the evolving demands and expectations. We envision this client to not only be a tool for integration but also a catalyst for optimizing the performance and capabilities of iOS applications utilizing the agilegravity event API.


## Usage for the EventApiClient

```swift
Usage for the EventApiClient
event = APIClient.EventBody(
    name: "prompt",
    text:  currentMessage,
    payload:  APIClient.EventPayload(
        eventCategory: "userMesssgage",
        eventAction: "Send",
        source: "IosApp"
    )
)

eventApiClient.eventAPICall( event: [event] , completion:  { brickResponse, error in brickResponse
    guard let brickResponse = brickResponse, error == nil else {
        print("Error calling the second API: \(error!.localizedDescription)")
        return
    }
    self.bricks += brickResponse
})

```