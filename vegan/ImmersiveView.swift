//
//  ImmersiveView.swift
//  vegan
//
//  Created by 沈赫 on 2026/3/31.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @Environment(AppModel.self) private var appModel
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
        .overlay(alignment: .topLeading) {
            Button("<") {
                Task { @MainActor in
                    appModel.immersiveSpaceState = .inTransition
                    await dismissImmersiveSpace()
                    openWindow(id: appModel.mainWindowID)
                }
            }
            .font(.system(size: 28, weight: .semibold))
            .padding(.top, 24)
            .padding(.leading, 24)
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
