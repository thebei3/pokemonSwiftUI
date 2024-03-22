//
//  ContentView.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var storyBoardPageCheck = false
    @State private var swiftUIPageCheck = false

    var body: some View {
        VStack(spacing: 100) {
            Button(action: {
                self.storyBoardPageCheck = true
            }) {
                Text("StoryBoard Page").foregroundColor(Color.black)
            }
            .sheet(isPresented: $storyBoardPageCheck) {
                storyBoardPage()
            }

            Button(action: {
                self.swiftUIPageCheck = true
            }) {
                Text("SwiftUI Page").foregroundColor(Color.black)
            }
            .sheet(isPresented: $swiftUIPageCheck) {
                swiftUIPage()
            }
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



