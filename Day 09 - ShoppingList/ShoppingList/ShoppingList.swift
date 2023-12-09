//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by The Coding Sprite on 26/11/2023.
//

import SwiftUI

struct ShoppingList: View {
    
    @Binding var currentImage1: Int
    @Binding var currentImage2: Int
    @Binding var roundCount: Int
    
    @Binding var shoppingList: [String]
    
    var restart: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(shoppingList, id: \.self) { food in
                        Text(food)
                    }
                }
                .navigationTitle("Christmas Shopping List")
                .navigationBarTitleDisplayMode(.inline)
                .background(Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .opacity(0.5))
                .scrollContentBackground(.hidden)
                
                Button {
                    // Restart
                    self.restart()
                    
                } label: {
                    Text("Restart")
                }
            }
        }
    }
}
