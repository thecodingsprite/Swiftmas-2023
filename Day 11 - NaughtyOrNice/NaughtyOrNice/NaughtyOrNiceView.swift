//
//  NaughtyOrNiceView.swift
//  NaughtyOrNice
//
//  Created by Billie Blanchard on 26/11/2023.
//

import SwiftUI

struct NaughtyOrNiceView: View {
    
    @Binding var selected: Int
    @Binding var isPressed: Bool
    
    var body: some View {
        if selected == 1 {
            Image("naughty")
                .resizeAnimateimage()
        }
        else {
                Image("nice")
                .resizeAnimateimage()
        }
        
        Button {
            // Reset
            withAnimation(.default.speed(1)) {
                isPressed = false
                selected = 0
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color("buttons"))
                
                Text("Try again")
                    .foregroundStyle(.white)
            }
            .frame(width: 150, height: 60)
        }
    }
}

extension Image {
    func resizeAnimateimage() -> some View {
        self
            .resizable()
            .transition(.move(edge: .top))
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    NaughtyOrNiceView(selected: .constant(1), isPressed: .constant(true))
}
