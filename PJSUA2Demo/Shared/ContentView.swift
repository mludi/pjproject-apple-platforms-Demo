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

    init() {
        pjsua2.createTransport()
        pjsua2.createAccount(onServer: "v7oliep.starface-cloud.com", forUser: "stdsip") {
            "geheim"
        }
    }
}

struct ContentView: View {
    @StateObject private var model = Model()

    var body: some View {
        Text("PJSIP Demo").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
