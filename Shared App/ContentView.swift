//
//  ContentView.swift
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 27.11.21.
//

import SwiftUI

struct ContentView: View {
    let remoteObject = remoteObjectFactory()
    @State var deviceNames = ["Sample"]
    var body: some View {
        VStack {
            Button("Get Devices") {
                remoteObject?.deviceNames({ names in
                    if let names = names {
                        self.deviceNames = names
                    }
                })
            }
            .padding()
            List(deviceNames, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
