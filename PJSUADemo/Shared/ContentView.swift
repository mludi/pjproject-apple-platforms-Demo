//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Epper on 24.08.22.
//

import SwiftUI
import PJSUA

final class Model: ObservableObject {
    @Published var text: String

    init() {
        do {
            try initPJSIP()
            text = "PJSIP initialized"
        } catch {
            text = "Failed: \(error)"
        }
    }
}

struct ContentView: View {
    @StateObject private var model = Model()

    var body: some View {
        Text(model.text)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
