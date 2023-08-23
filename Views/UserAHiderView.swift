//
//  UserAHiderView.swift
//  You Hide I find
//
//  Created by Miras Adilov on 8/21/23.
//

import SwiftUI
import RealityKit

struct UserAHiderView: View {
    @StateObject private var arViewModel = ARViewModel() // init my ARViewModel
    
    var body: some View {
        VStack {
            Text("User A - Hide an Object")
                .font(.headline)
                .padding()
            
            ARViewContainerView(arViewModel: arViewModel)
                .frame(height: 300)
            
            Button("Choose object to hide") {
                // Load your USDZ object and pass it to arViewModel.placeObject
                // Example: let objectEntity = loadUSDZObject()
                // arViewModel.placeObject(objectEntity)
                if let objectEntity = loadUSDZObject() {
                                    arViewModel.placeObject(objectEntity)
                                }
            }
            .padding()
        }
    }
    
    private func loadUSDZObject() -> Entity? {

            guard let uzdsFolderURL = Bundle.main.url(forResource: "uzds_models", withExtension: nil) else {
                return nil
            }
        print(uzdsFolderURL)
            
            do {
                let contents = try FileManager.default.contentsOfDirectory(at: uzdsFolderURL, includingPropertiesForKeys: nil)
                let usdzFiles = contents.filter { $0.pathExtension.lowercased() == "usdz" }
                if let randomUSDZFile = usdzFiles.randomElement() {
                    let objectEntity = try Entity.load(contentsOf: randomUSDZFile)
                    return objectEntity
                }
            } catch {
                print("Error loading USDZ object:", error)
            }
            
            return nil
        }
}

struct UserAHiderView_Previews: PreviewProvider {
    static var previews: some View {
        UserAHiderView()
    }
}

