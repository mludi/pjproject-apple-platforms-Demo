//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Epper on 24.08.22.
//

import SwiftUI
import PJSUA2

final class Model: ObservableObject {
    private var pjsua2 = PJSUA2()
    @Published var lastCallId: Int32? = -99

    init() {
        pjsua2.createTransport()
        pjsua2.createAccount(onServer: "v7oliep.starface-cloud.com", forUser: "stdsip") {
            "mHH1uXMv8Sk4A2uZ72rsFNwn5F7tra"
        }
        pjsua2.incomingCalls().map(Optional.some).assign(to: &$lastCallId)
        pjsua2.libStart()
    }
}

struct ContentView: View {
    @StateObject private var model = Model()

    var body: some View {
        VStack {
            Text("PJSIP Demo")
            if let lastCallId = model.lastCallId {
                Text("Last CallId: \(lastCallId)")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
