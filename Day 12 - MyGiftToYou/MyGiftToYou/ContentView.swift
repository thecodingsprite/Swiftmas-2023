//
//  ContentView.swift
//  MyGiftToYou
//
//  Created by The Coding Sprite on 23/11/2023.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    @State var isOpen = false
    
    var body: some View {
        ZStack {
            
            // Open the gift
            if isOpen {
                
                GiftOpenView()
                
            } else {
                
                // Closed gift
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 250, height: 50)
                            .foregroundStyle(.yellow)
                            .opacity(0.5)
                        
                        
                        Text("Please open my gift to you!")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 60)
                    
                    Spacer()
                    
                    Button {
                        // Play sound
                        AudioServicesPlaySystemSound(1021)
                        
                        withAnimation(.default .speed(0.8)) {
                            isOpen = true
                        }
                    } label: {
                        Image("gift-closed")
                            .resizable()
                        .aspectRatio(contentMode: .fit)}
                    
                    Spacer()
                }
                .padding()
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ContentView()
}
