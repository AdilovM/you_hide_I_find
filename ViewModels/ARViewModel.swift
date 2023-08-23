//
//  ARViewModel.swift
//  You Hide I find
//
//  Created by Miras Adilov on 8/21/23.
//

import RealityKit
import Combine
class ARViewModel: ObservableObject {
    var arView: ARView!
    
    func placeObject(_ entity: Entity) {
        guard let raycastResult = arView.raycast(from: arView.center, allowing: .estimatedPlane, alignment: .horizontal).first else {
            return
        }
        
        let anchor = AnchorEntity(world: raycastResult.worldTransform)
        anchor.addChild(entity)
        arView.scene.anchors.append(anchor)
    }
}
