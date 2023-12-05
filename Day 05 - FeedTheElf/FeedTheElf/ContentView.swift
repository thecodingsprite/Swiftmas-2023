//
//  ContentView.swift
//  FeedTheElf
//
//  Created by The Coding Sprite on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isBoyElf = true
    
    // Keep track of scale amount for elf head
    @State var elfScale = 1.0
    
    // Store the cookie scale
    @State private var cookieScale = 1.0
    
    // Toggle for burping
    @State var burp = false
    
    var body: some View {
        ZStack {
            // BG
            Color.green
                .ignoresSafeArea()
                .opacity(0.2)
            
            // Title
            VStack (alignment: .center) {
                Text("Feed the Elf some cookies")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                    .padding(.top)
                
                Spacer()
            }
            
            // Elf
            VStack (spacing: 0) {
                
                Image(isBoyElf ? "boy-face" : "girl-face")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding( .trailing, isBoyElf ? 15 : -15)
                    .padding(.bottom, isBoyElf ? -10 : -20)
                    .scaleEffect(elfScale)
                    .animation(.easeInOut(duration: 1), value: elfScale)
                    .zIndex(1.0)
                
                Image(isBoyElf ? "boy-body" : "girl-body")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 200)
            
            // Cookie
            VStack {
                Spacer()
                
                Button {
                    // Effect the cookie scale
                    cookieScale = 1.2
                    
                    // Append scale of elf head
                    elfScale += 0.1
                    
                    // Reset Cookie Scale after a delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        self.cookieScale = 1.0
                    }
                    if elfScale > 2.3 {
                        showBurp()
                        
                        withAnimation {
                            self.elfScale = 1.0
                        }
                    }
                    
                } label: {
                    Image("cookie")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .scaleEffect(cookieScale)
                        .animation(.easeInOut(duration: 0.5), value: cookieScale)
                }
            }
            
            // Change elf to elfette
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        isBoyElf.toggle()
                    } label: {
                        Image(isBoyElf ? "girl-icon" : "boy-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                }
                }
                .padding()
            }
            
            // Reset Game after elf is full up
            if burp {
                VStack {
                    Image("burp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    
                    
                    Spacer()
                }
            }
        }
    }
    
    func showBurp() {
        // Show image
        burp = true

        // Hide image again after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.burp = false
        }
    }
}

#Preview {
    ContentView()
}
