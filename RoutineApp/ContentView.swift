//
//  ContentView.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
                .font(Font.custom("Cardo-Italic", size: 30))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
