//
//  ContentView.swift
//  ShoppingList
//
//  Created by The Coding Sprite on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentImage1 = 1
    @State var currentImage2 = 1
    @State var roundCount = 1
    
    @State var isSkipped = false
    @State var wantsBoth = false
    
    var food1 = ["Wine", "Crisps", "Pate","Brussels Sprouts", "Roast Potatoes", " Beef Joint", "Pigs in Blankets", "Lobster", "Ice Cream", "Fruit"]
    
    var food2 = ["Fizzy Drinks", "Chocolate", "Prawns", "Broccoli", "Mashed Potatoes", "Turkey", "Yorkshire Puddings", "Crab", "Christmas Pudding", "Box of Chocolates"]
    
    @State var shoppingList: [String] = []
    
    var body: some View {
        
        if roundCount != 10 {
            ZStack {
                
                // Background
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack {
                    Spacer()
                    Text("Select a food to add to the shopping list.")
                        .padding(.bottom, 200)
                    Spacer()
                    Spacer()
                }
                    
                    HStack {
                        // Image 01
                        Button {
                            // Next image
                            currentImage1 += 1
                            
                            // Add this food to the shopping list
                            shoppingList.append(food1[roundCount - 1])
                            
                            
                            // Update currentImage2 to match the next round
                            currentImage2 += 1
                            
                            // Update which round we are on
                            roundCount += 1
                            
                        } label: {
                            VStack {
                                
                                Image("image1-\(currentImage1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                
                                Text(food1[roundCount - 1])
                                    .foregroundStyle(.black)
                            }
                        }

                        // Image 02
                        Button {
                            // Next image
                            currentImage2 += 1
                            
                            // Add this food to the shopping list
                            shoppingList.append(food2[roundCount - 1])
                            
                            // Update currentImage1 to match the next round
                            currentImage1 += 1
                            
                            // Update which round we are on
                            roundCount += 1
                        } label: {
                            VStack {
                                
                                Image("image2-\(currentImage1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                
                                Text(food2[roundCount - 1])
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                   
                VStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                        // Select both
                        Button {
                            // Add both items to list
                            shoppingList.append(food1[roundCount - 1])
                            shoppingList.append(food2[roundCount - 1])
                            
                            // Next images
                            currentImage1 += 1
                            currentImage2 += 1
                            
                            // Update which round we are on
                            roundCount += 1
                        } label: {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.green)
                                    .opacity(0.6)
                                    .frame(width: 100, height: 50)
                                
                                Text("Add both")
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.top, 100)
                        
                    
                    Spacer()
                    
                    // Skip this round
                    Button {
                        
                        // Next images
                        currentImage1 += 1
                        currentImage2 += 1
                        
                        // Update which round we are on
                        roundCount += 1
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.red)
                                .frame(width: 100, height: 50)
                            Text("Skip round")
                                .foregroundStyle(.white)
                        }
                    }
                }
                
            }
        }
        
        // When series ends - display shopping list
        if roundCount == 10 {
            ShoppingList(currentImage1: $currentImage1, currentImage2: $currentImage2, roundCount: $roundCount, shoppingList: $shoppingList, restart: {self.restart()})
            
        }
    }
    func restart() {
        
        roundCount = 1
        currentImage1 = 1
        currentImage2 = 1
    }
}

#Preview {
    ContentView()
}
