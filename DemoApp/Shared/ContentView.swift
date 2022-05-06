//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Epper on 05.05.22.
//

import SwiftUI
import PJSIP

final class Model: ObservableObject {
    @Published var text: String
    
    init() {
        do {
            try initPjSIP()
            text = "PjSIP initialized"
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
