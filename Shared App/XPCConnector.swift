//
//  XPCConnector.swift
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 29.11.21.
//

import Foundation

func remoteObjectFactory() -> XPCServiceTestProtocol? {
    let myInterface = NSXPCInterface(with: XPCServiceTestProtocol.self)

    let myConnection = NSXPCConnection(serviceName: "com.vonbelow.xpcTest")
// 'init(serviceName:)' is unavailable in Mac Catalyst
    myConnection.remoteObjectInterface = myInterface
    myConnection.resume()
    guard let remoteObject = myConnection.remoteObjectProxyWithErrorHandler({ error in
        debugPrint("No Remote Object")
    }) as? XPCServiceTestProtocol else {
        debugPrint("Unable to convert")
        return nil
    }
    return remoteObject
}
