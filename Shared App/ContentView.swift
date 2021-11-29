//
//  ContentView.swift
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 27.11.21.
//

import SwiftUI

struct ContentView: View {
    let remoteObject = remoteObjectFactory()
    @State var theString = ""
    var body: some View {
        VStack {
            TextField("Text", text: $theString)
                .padding()
            Button("Convert") {
                remoteObject?.upperCaseString(theString, withReply: { reply in
                    guard let result = reply else {
                        debugPrint("No result")
                        return
                    }
                    theString = result
                })
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
