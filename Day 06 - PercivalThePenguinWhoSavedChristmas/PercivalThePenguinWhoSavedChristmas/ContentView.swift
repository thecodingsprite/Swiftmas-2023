//
//  ContentView.swift
//  PercivalThePenguinWhoSavedChristmas
//
//  Created by The Coding Sprite on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

            ScrollView() {
                VStack(spacing: 50) {
                    
                    Text(Story.percy[0])
                    Text(Story.percy[1])
                    Text(Story.percy[2])
                    
                    Image("percy-1")
                        .imageAspect()
                    
                    Text(Story.percy[3])
                    Text(Story.percy[4])
                    Text(Story.percy[5])
                        .bold()
                    
                    Image("crash")
                        .imageAspect()
                    
                    Text(Story.percy[6])
                    Image("percy-2")
                        .imageAspect()
                    
                    Text(Story.santa[0])
                        .modifier(santaText())
                        .font(Font.system(size: 30))
                        .padding(.top, 30)
                    
                    Text(Story.santa[1])
                        .modifier(santaText())
                    
                    Image("santa")
                        .imageAspect()
                    
                    Text(Story.percy[7])
                    
                    Image("santa-crash")
                        .imageAspect()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text(Story.percy[8])
                    
                    Text(Story.santa[2])
                        .modifier(santaText())
                    
                    Image("tinkering")
                        .imageAspect()
                    
                    Text(Story.santa[3])
                        .modifier(santaText())
                    
                    Text(Story.percy[9])
                    
                    Image("fixing-sleigh-01")
                        .imageAspect()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Text(Story.percy[10])
                    
                    Text(Story.santa[4])
                        .modifier(santaText())
                    
                    Text(Story.percy[11])
                    
                    Text(Story.santa[5])
                        .modifier(santaText())
                    
                    Image("presents")
                        .imageAspect()
                    
                    Text(Story.percy[12])
                        .bold()
                        .font(Font.system(size: 20))
                    
                    Image("percy-3")
                        .imageAspect()
                    
                    Text(Story.santa[6])
                        .modifier(santaText())
                        .padding(.top, 100)
                        .font(.title2)
                    
                    Image("santa-end")
                        .imageAspect()
                }
                .padding()
                .padding(.top, 100)
            }
            .scrollContentBackground(.hidden)
            .background(Color("bg"))

    }
}

// MARK: - Modifiers

struct santaText: ViewModifier {
    func body(content: Content) -> some View {
        content
        .fontWeight(.medium)
        .foregroundColor(Color.red)
    }
}

extension Image {
    func imageAspect() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ContentView()
}
