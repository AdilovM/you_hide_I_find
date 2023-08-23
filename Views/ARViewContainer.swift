//
//  ARViewContainer.swift
//  You Hide I find
//
//  Created by Miras Adilov on 8/21/23.
//

import SwiftUI
import RealityKit

struct ARViewContainerView: UIViewRepresentable {
    let arViewModel: ARViewModel

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arViewModel.arView = arView // Set the ARView reference in the ARViewModel
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Update your ARView if needed
    }
}

