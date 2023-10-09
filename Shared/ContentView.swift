//
//  ContentView.swift
//  Shared
//
//  Created by Benedikt Weiner on 06.10.23.
//

import SwiftUI

import Foundation


struct ContentView: View {
    @State private var currentMessage: String = ""
    @State private var bricks: [APIClient.Brick] = []

    private var eventApiClient: APIClient


    init( ) {
        self.eventApiClient  = APIClient(
            channelId: "<YOUR_CHANNEL_ID>",
            apiSecret: "<YOUR_API_SECRET>"
        )
        let payload = APIClient.EventPayload(
            eventCategory: "a",
            eventAction: "a",
            source: "a"
        )

        let event = APIClient.EventBody(
            name: "getInitialData",
            text:  currentMessage,
            payload: payload
        )
        //
        //                self.eventApiClient.eventAPICall( event: [event],  completion:  { brickResponse, error in brickResponse
        //                    guard let brickResponse = brickResponse, error == nil else {
        //                        print("Error calling the second API: \(error!.localizedDescription)")
        //                        return
        //                    }
        //                    self.bricks += brickResponse
        //                    print("Response from the second API: \(brickResponse)")
        //                })
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(bricks, id: \.id) { brick in
                        switch brick.content.data {
                        case .object(let data):
                            if let content = data["content"] {
                                switch content {
                                case .string(let contentString):
                                    Text(contentString)
                                default:
                                    EmptyView()

                                }
                            }
                        default:
                            EmptyView()
                        }
                    }
                }

            }


            HStack {
                TextField("Type a message", text: $currentMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    sendPost()
                }) {
                    Text("Send")
                        .padding(.horizontal)
                }
            }
        }
    }
    func sendPost() {
        if !currentMessage.trimmingCharacters(in: .whitespaces).isEmpty {


            let event = APIClient.EventBody(
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
                print("Response from the second API: \(brickResponse)")
            })

            currentMessage = ""
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




