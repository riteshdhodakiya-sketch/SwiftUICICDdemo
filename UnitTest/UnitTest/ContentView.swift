//
//  ContentView.swift
//  UnitTest
//
//  Created by Ritesh Dhodakia on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint) // Lint error: Trailing whitespace here ⬅️
                
            Text("Hello, world!") // Lint error: Missing documentation for this public struct/function (if configured)
        } // Lint error: Missing empty line before closing brace (depending on SwiftLint config)
        .padding() // Lint error: Line length > 100 (if you add a long comment here)
    }
}


#Preview {
    ContentView()
}
