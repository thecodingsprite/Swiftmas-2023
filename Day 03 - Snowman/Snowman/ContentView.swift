//
//  ContentView.swift
//  Snowman
//
//  Created by The Coding Sprite on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isHat = false
    @State var isScarf = false
    @State var isButtons = false
    @State var isWinking = false
    
    var body: some View {
        ZStack {
            
            // Buttons
            VStack {
                HStack (spacing: 40) {
                    Button {
                        isHat.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("hat")
                                .buttonImageStyle()
                            
                            Text("Hat")
                                .modifier(ButtonTextStyle())
                        }
                    }
                    
                    Button {
                        isScarf.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("scarf")
                                .buttonImageStyle()
                            
                            Text("Scarf")
                                .modifier(ButtonTextStyle())
                        }
                    }
                    
                    Button {
                        isButtons.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("button-icon")
                                .buttonImageStyle()
                            
                            Text("Buttons")
                                .modifier(ButtonTextStyle())
                        }
                    }
                    Button {
                        isWinking.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("wink")
                                .buttonImageStyle()
                            
                            Text("Wink")
                                .modifier(ButtonTextStyle())
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // Snowman shadow
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 80)
                    .frame(width: 200, height: 35)
                    .blur(radius: 20)
                    .rotation3DEffect(.degrees(60),axis: (1,0,0))
                    .padding(.bottom, 10)
                    .opacity(0.3)
            }
            
            
            // Arms
            VStack {
                HStack (spacing: 100) {
                    Image("arm1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                    
                    Image("arm2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }
            }
            .padding(.bottom, 100)
            
            // Snowman
            VStack(spacing: 0) {
                
                ZStack {
                    // Head
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 180)
                        .padding(.bottom, -30)
                    // Face features
                    VStack (spacing: 10){
                        // Eyes
                            HStack (spacing: 20) {
                                
                                if isWinking {
                                    // L eye
                                    ZStack {
                                        Circle()
                                            .foregroundStyle(.blue)
                                            .frame(width: 15)
                                        Circle()
                                            .foregroundStyle(.black)
                                            .frame(width: 8)
                                    }

                                    // R eye
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.black)
                                            .frame(width: 15, height: 5)
                                            .padding(.vertical, 5)
                                    
                                } else {
                                    
                                    // L eye
                                    ZStack {
                                        Circle()
                                            .foregroundStyle(.blue)
                                            .frame(width: 15)
                                        Circle()
                                            .foregroundStyle(.black)
                                            .frame(width: 8)
                                    }
                                    // R eye
                                    ZStack {
                                        Circle()
                                            .foregroundStyle(.blue)
                                            .frame(width: 15)
                                        Circle()
                                            .foregroundStyle(.black)
                                            .frame(width: 8)
                                    }
                                }
                            }
                        
                        
                        // Nose
                        Nose()
                            .foregroundStyle(.orange)
                            .frame(width: 20, height: 40)
                            .rotationEffect(Angle(degrees: 180))
                        
                        // Mouth
                        Mouth(startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
                            .stroke(.black, lineWidth: 5)
                            .frame(width: 30, height: 5)
                    }
                    
                }
                
                ZStack {
                    // Midrif
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 220)
                        .padding(.bottom, -40)
                    
                    // Buttons
                    if isButtons {
                        VStack(spacing: 40) {
                            Image("button2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                            
                            Image("button1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                        .padding(.top, 70)
                    }
                    
                }
                ZStack {
                    // Body Base
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 280)
                    
                    // Buttons
                    if isButtons {
                        VStack (alignment: .leading) {
                            Image("button2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                            
                        }
                        .padding(.bottom, 195)
                    }
                    
                }
            } .padding(.top, 100)
            
            // Top Hat
            if isHat {
                VStack (spacing: 0) {
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 120, height: 60)
                        .padding(0)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 5)
                    
                    Spacer()
                }
                .padding(.top, 80)
            }
            
            
            // Scarf
            if isScarf {
                VStack {
                    Spacer()
                    // Scarf neck
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.red)
                        .frame(width: 160, height: 20)
                        .padding(.top, 45)
                    Spacer()
                    Spacer()
                }
                
                
                VStack {
                    Spacer()
                    // Scarf dangle
                    RoundedRectangle(cornerRadius:2)
                        .foregroundStyle(.red)
                        .frame(width: 20, height: 150)
                        .padding(.bottom, 50)
                        .padding(.trailing, 80)
                    
                    Spacer()
                }
            }
        }
        .background (
            Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
        )
    }
}
// MARK: - Nose Shape
struct Nose: Shape {
   
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

// MARK: - Mouth Shape

struct Mouth: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        
           var path = Path()
        
           path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

           return path
       }
}

extension Image {
    func buttonImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50)
    }
}

struct ButtonTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
