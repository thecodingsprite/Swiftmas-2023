//
//  GiftOpenView.swift
//  MyGiftToYou
//
//  Created by The Coding Sprite on 26/11/2023.
//

import SwiftUI

struct GiftOpenView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            // Affirmation
            Text("Confusion is part of programming. You made it through the challenge. You learned something new everyday...& I am truly proud of YOU!")
                .frame(width: 200)
                .padding(40)
                .bold()
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.yellow)
                        .blur(radius: 30.0)
                        .opacity(0.8)
                )
                .transition(.opacity)
            
            Image("gift-open")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.padding(.top, 250)
                .transition(.opacity)
            
            Spacer()
            
            Text("Merry Christmas!")
                .padding(40)
                .bold()
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red)
                        .blur(radius: 30.0)
                        .opacity(0.8)
                )
            
            Text("Thank you for joining in Swiftmas 2023!")
                .font(.caption)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    GiftOpenView()
}
