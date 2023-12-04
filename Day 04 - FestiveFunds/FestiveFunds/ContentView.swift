//
//  ContentView.swift
//  FestiveFunds
//
//  Created by The Coding Sprite on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var giftsToBuy = 0
    @State var budget = 0
    @State var amountOfPeople = 0
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                // Funds available
                Section {
                    TextField("budget", value: $budget, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                } header: {
                    Text("What's your budget this festive season?")
                }
                
                // Amount of people to divide funds by
                Section {
                    TextField("people", value: $amountOfPeople, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                } header: {
                    Text("How many people to buy for?")
                }
              
                // Optional: How many gifts per person
                Section {
                    TextField("gifts", value: $giftsToBuy, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                } header: {
                    Text(" How many gift's per person would you like?")
                } footer: {
                    Text("Optional")
                        .font(.caption)
                }

                // Results
                Section {
                    // Display Budget per person
                    if budget > 0 && amountOfPeople > 0 {
                        
                        var totalPerPerson = budget / amountOfPeople
                        
                        Text("You can spend £\(totalPerPerson) per person")
                        
                        // Display gifts per person
                        if giftsToBuy > 0 {
                            
                            var giftAmount = totalPerPerson / giftsToBuy
                            
                            Text("Aim to spend £\(giftAmount) on each gift")
                        }
                    }
                } header: {
                    Text("Results")
                }
            }
            .background(Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.5))
            .scrollContentBackground(.hidden)
            .navigationTitle("Festive Funds")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
