//
//  ContentView.swift
//  BoopThePet
//
//  Created by The Coding Sprite on 22/11/2023.
//

import SwiftUI
import AudioToolbox

struct ContentView: View {
    
    @State var isNoseBooped = false
    
    var body: some View {
        ZStack {
            // Background
            Color.mint
                .ignoresSafeArea()
            
            // Instruction
            VStack {
                Text(isNoseBooped ? "Meow ho ho" : "Boop the nose")
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            // Cat Images
            Image(isNoseBooped ? "antlers" : "")
                .resize()
            
            Image("cat-body")
                .resize()
            
            Image(isNoseBooped ? "eyes-closed" : "eyes-open")
                .resize()
            
            if isNoseBooped == false {
                Image("nose-1")
                    .resize()
                    .onTapGesture {
                        withAnimation {
                            // Meow sound
                            SystemSoundID.playFileNamed(fileName: "Meow", withExtenstion: "mp3")
                            
                            isNoseBooped.toggle()
                        }
                    }
                }
            
            // Festive Nose
            if isNoseBooped {
                ZStack {
                    
                    VStack {
                        Spacer()
                        
                        // Nose glow
                        Circle()
                            .foregroundStyle(.red)
                            .blur(radius: 5.0)
                            .opacity(0.6)
                            .frame(width: 50)
                            .padding(.bottom, 160)
                            .padding(.trailing, 25)
                        
                        Spacer()
                        
                        Text("Meowy Christmas")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.red)
                            .padding()
                    }
                    
                    Image("nose-2")
                        .resize()
                        .onTapGesture {
                            withAnimation {
                                isNoseBooped.toggle()
                            }
                        }
                }
            }
        }
    }
}

// MARK: - Custom Modifiers

extension Image {
    func resize() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


extension SystemSoundID {
    static func playFileNamed(fileName: String, withExtenstion fileExtension: String) {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}

#Preview {
    ContentView()
}
