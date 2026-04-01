//
//  ContentView.swift
//  vegan
//
//  Created by 沈赫 on 2026/3/31.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Welcome to codename vegan")
                    .font(.system(size: 44, weight: .semibold))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            VStack {
                ToggleImmersiveSpaceButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
