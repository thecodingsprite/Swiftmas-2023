//
//  ContentView.swift
//  FestiveRecipes
//
//  Created by The Coding Sprite on 21/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Form {
                Section {
                    // Title
                    Text("Billie's Chocolate Fudge Cake")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                }
                //Image
                Image("cake")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                // Ingredients
                Section {
                    // Flour instruction
                    HStack {
                        Image(systemName: "circle.fill")
                            .resize()
                        
                        HStack {
                            Text("3oz of Plain Flour")
                                .bold()
                            Text("(any plain flour will be fine even gluten free. I personally use white rice flour due to my allergies)")
                                .font(Font.system(size: 12))
                        }
                    }
                    // All other ingredients
                    ForEach (CakeRecipe.ingredients, id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "circle.fill")
                                .resize()
                            Text(ingredient)
                                .bold()
                        }
                        
                    }
                    // Optional ingredient
                    HStack {
                        Image(systemName: "circle.fill")
                            .resize()
                        HStack {
                            Text("2tsp Vanilla Essence")
                                .bold()
                            Text("Optional")
                                .font(Font.system(size: 12))
                        }
                    }
                } header: {
                    Text("Ingredients for a Single Cake")
                }
                
                // Icing ingredients
                Section {
                    ForEach (CakeRecipe.icingIngredients, id: \.self) { icing in
                        HStack {
                            Image(systemName: "circle.fill")
                                .resize()
                            
                            Text(icing)
                                .bold()
                        }
                    }
                } header: {
                    Text("Ingredients for Icing")
                }
                
                
                //Recipe instructions
                Section {
                    ForEach(CakeRecipe.cakeRecipe, id: \.self) { instructions in
                        Text(instructions)
                    }
                } header: {
                    Text("Cake Instructions")
                }
                
                //Icing instructions
                Section {
                    ForEach(CakeRecipe.icingRecipe, id: \.self) { recipe in
                        Text(recipe)
                    }
                } header: {
                    Text("To Fudge It")
                }
            }
            .background(Color.brown
                        .gradient)
            .scrollContentBackground(.hidden)
        }
    }
}

// MARK: - Custom Modifiers

extension Image {
    
    func resize() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 5)
    }
}
    #Preview {
        ContentView()
    }
