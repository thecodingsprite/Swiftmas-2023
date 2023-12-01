//
//  ContentView.swift
//  ChristmasCountdown
//
//  Created by The Coding Sprite on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var daysLeftTillChristmas = 0
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.7)
            
            // Darken bg
            Color(.black)
                .ignoresSafeArea()
                .opacity(0.2)
            
            // Countdown Days
            HStack(spacing: 20) {
                
                // TODO: Implement logic dynamic on days left
                Image("\(daysLeftTillChristmas)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                
              
                
                // Text design
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(Color("buttons"))
                        .opacity(0.9)
                        .frame(width: 400, height: 80)
                        
                    Text("Day's Till Christmas")
                        .font(Font.system(size: 40))
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            
            // Share button
            VStack {
                HStack() {
                    
                    Spacer()
                    
                    Button(action: shareButton) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(Color("buttons"))
                            .scaleEffect(1.5)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 50)
        }
        .onAppear {
            daysLeftTillChristmas = self.countdown()
        }
       
    }
    
    
    func countdown() -> Int {
        
        // create date components of 12/24
        let christmasComponents = DateComponents(month: 12, day: 25)
        
        // get next christmas date
        let nextChristmas = Calendar.current.nextDate(after: Date(), matching: christmasComponents, matchingPolicy: .strict)!
        
        // calculate number of days left
        let daysLeft = Calendar.current.dateComponents([.day], from: Date() , to: nextChristmas).day!
        
        return daysLeft
    }
    
    /// Credit: /www.boltuix.com taught me this
    func shareButton() {
            let url = URL(string: "https://www.thecodingsprite.com/")
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
}
#Preview {
    ContentView()
}
