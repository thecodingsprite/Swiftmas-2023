//
//  ContentView.swift
//  NaughtyOrNice
//
//  Created by The Coding Sprite on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    // Track app start
    @State var isPressed = false
    
    @State var selected = 0
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            // Onboarding
            if isPressed != true {
                VStack(spacing: 50) {
                    
                    Text("Have you been naughty or nice this year? Are you brave enough to find out...")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Image("naughty_or_nice")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Button {
                        // Next step in app
                        withAnimation(.default.speed(0.1)) {
                            isPressed = true
                            
                            // Randomly set selected number
                            selected = Int.random(in: 1...2)
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color("buttons"))
                            
                            Text("Find out which list I'm on")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 250, height: 80)
                    }
                }
                .padding()
            }
            
            // Naughty or nice view
            VStack {
            if isPressed {
                  NaughtyOrNiceView(selected: $selected, isPressed: $isPressed)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
