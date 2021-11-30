//
//  ContentView.swift
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 27.11.21.
//

import SwiftUI

struct ContentView: View {
    let remoteObject = remoteObjectFactory()
    @State var deviceNames = ["Loading …"]
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                VStack {
                    Text ("Devices seen by App")
                    Text ("(Library Validation Endabled)")
                        .font(.subheadline)
                }
                    .padding()
                List(AVDeviceHelper.avDeviceNames(), id: \.self) { name in
                    Text(name)
                }
            }
            VStack {
                VStack {
                    Text ("Devices seen by XPC Service")
                    Text ("(Library Validation Disabled)")
                        .font(.subheadline)
                }
                .padding()
                List(deviceNames, id: \.self) { name in
                    Text(name)
                }
                .onAppear {
                    remoteObject?.deviceNames({ names in
                        if let names = names {
                            self.deviceNames = names
                        }
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
