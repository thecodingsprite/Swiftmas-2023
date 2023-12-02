//
//  ContentView.swift
//  Tree
//
//  Created by The Coding Sprite on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isBaublesOn = false
    @State var isStarsOn = false
    @State var isCandyOn = false
    @State var isGiftsOn = false
    
    var body: some View {
        VStack {
            // Buttons
            HStack (alignment: .bottom, spacing: 50) {
                Button {
                    isBaublesOn.toggle()
                } label: {
                    VStack {
                        Image("bauble")
                            .imageModify()
                            .frame(width: 30)
                        Text("Add Baubles")
                            .tint(.red)
                    }
                }
                Button {
                    isStarsOn.toggle()
                } label: {
                    VStack {
                        Image("star")
                            .imageModify()
                            .frame(width: 35)
                        Text("Add Stars")
                            .tint(.green)
                    }
                }
                Button {
                    isCandyOn.toggle()
                } label: {
                    VStack {
                        Image("candy")
                            .imageModify()
                            .frame(width: 50)
                        Text("Add Candy")
                            .tint(.red)
                    }
                }
                Button {
                    isGiftsOn.toggle()
                } label: {
                    VStack {
                        Image("gift")
                            .imageModify()
                            .frame(width: 35)
                        Text("Add Gifts")
                            .tint(.green)
                    }
                }
                
            }
            .padding()
            
            Spacer()
            
            // Imagery
            ZStack {
                // Base Layer
                Image("tree-06")
                    .imageModify()
                
                // Add baubles
                if isBaublesOn {
                    Image("baubles-06")
                        .imageModify()
                }
                
                // Add candy
                if isCandyOn {
                    Image("candy-06")
                        .imageModify()
                }
                
                Image("tree-05")
                    .imageModify()
                
                // Add baubles
                if isBaublesOn {
                    Image("baubles-05")
                        .imageModify()
                }
                
                // Add candy
                if isCandyOn {
                    Image("candy-05")
                        .imageModify()
                }
                
                // Add stars
                if isStarsOn {
                    Image("stars-05")
                        .imageModify()
                }
                
                Image("tree-04")
                    .imageModify()
                
                // Add candy
                if isCandyOn {
                    Image("candy-04")
                        .imageModify()
                }
                Image("tree-03")
                    .imageModify()
                // Add baubles
                if isBaublesOn {
                    Image("baubles-03")
                        .imageModify()
                }
                
                Image("tree-02")
                    .imageModify()
                
                // Add stars
                if isStarsOn {
                    Image("stars-02")
                        .imageModify()
                }
                
                Image("tree-01")
                    .imageModify()
                
                // Add baubles
                if isBaublesOn {
                    Image("baubles-01")
                        .imageModify()
                    }
                
                // Add candy
                if isCandyOn {
                    Image("candy-01")
                        .imageModify()
                }
                
                // Add gifts
                if isGiftsOn {
                    Image("gifts")
                        .imageModify()
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

extension Image {
    func imageModify() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ContentView()
}
