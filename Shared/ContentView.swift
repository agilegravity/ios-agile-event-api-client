//
//  ContentView.swift
//  Shared
//
//  Created by Benedikt Weiner on 06.10.23.
//

import SwiftUI
import OpenAPIClient
import Foundation
struct ContentView: View {
    @State private var response = ""
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        Button(action: sendPost) {
            Text("Send Post")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
    func sendPost() {
        

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
//        let post = Post(title: "Hello, world!", body: "This is a test post.")
//
//        guard let url = URL(string: "https://api.example.com/posts") else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let jsonData = try JSONEncoder().encode(post)
//            request.httpBody = jsonData
//        } catch {
//            print("Error encoding post object:", error)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error sending request:", error ?? "No error")
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.response = String(data: data, encoding: .utf8) ?? "No data"
//            }
//        }
//        task.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Post: Codable {
var title: String
var body: String
}
/*
import SwiftUI
import Foundation

struct ContentView: View {
    @State private var title = ""
    @State private var body = ""
    @State private var response = ""
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Body", text: $body)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: sendPost) {
                Text("Send Post")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text(response)
                .padding()
        }
        .padding()
    }
    
    func sendPost() {
        let post = Post(title: title, body: body)
        
        guard let url = URL(string: "https://api.example.com/posts") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(post)
            request.httpBody = jsonData
        } catch {
            print("Error encoding post object:", error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error sending request:", error ?? "No error")
                return
            }
            
            DispatchQueue.main.async {
                self.response = String(data: data, encoding: .utf8) ?? "No data"
            }
        }
        task.resume()
    }
}

struct Post: Codable {
    var title: String
    var body: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
