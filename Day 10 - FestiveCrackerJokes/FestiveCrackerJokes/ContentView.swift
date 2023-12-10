//
//  ContentView.swift
//  FestiveCrackerJokes
//
//  Created by The Coding Sprite on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var jokeTracker = 0
    
    var body: some View {
        
        
        ZStack {
            // Background
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack {
                Spacer()
                
                // Joke
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding()
                        .frame(height: 300)
                        .foregroundStyle(Color("joke-box"))
                        .opacity(0.8)
            
                    // Dynamically show jokes
                    Text(Jokes.jokes[jokeTracker])
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                
                HStack {
                    
                    // Previous
                    Button {
                        // Previous joke
                        if jokeTracker != 0 {
                            jokeTracker -= 1
                        } else {
                            // Do nothing as we can't go any further back
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                                .foregroundStyle(Color("button-box"))
                            
                            Text("Previous")
                                .foregroundStyle(.white)
                        }
                    }
                    
                    
                    // Next
                    Button {
                        // Reset jokes back to start if at the end
                        if jokeTracker >= 29 {
                            jokeTracker = 0
                        } else {
                            // Next joke
                            jokeTracker += 1
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                                .foregroundStyle(Color("button-box"))
                            
                            Text("Next")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(width: 350)
                
                
                // Randomise joke
                Button {
                    jokeTracker = Int.random(in: 0...29)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundStyle(Color("button-box"))
                        
                        Text("Random")
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 50)
                }
            }
            .frame(width: 350)
        }
    }
}

#Preview {
    ContentView()
}
