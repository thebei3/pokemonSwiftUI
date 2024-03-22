//
//  storyBoardPage.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import Foundation
import SwiftUI


struct storyBoardPage: View {
    var body: some View {
        
        ZStack {
            storyBoardView().edgesIgnoringSafeArea(.all)            
        }
    }
}


struct storyBoardView : UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "MyRoot")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
