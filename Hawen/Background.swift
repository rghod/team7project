//
//  Background.swift
//  t7project
//
//  Created by Rand Soliman Alobaid on 26/03/1446 AH.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            // Full background color
            Color(hex: "0F133C") // Custom color using hex code
            
            // Predefined positions for circles with closer spacing and lower placement
            let positions = [
                CGPoint(x: 50, y: 10),
                CGPoint(x: 30, y: 100),
                CGPoint(x: 100, y: 70),
                CGPoint(x: 150, y: 120),
                CGPoint(x: 250, y: 190), // النقطه القريبه للعنوان
                CGPoint(x: 150, y: 10),
                CGPoint(x: 350, y: 30),
                CGPoint(x: 200, y: 100),
                CGPoint(x: 250, y: 70),
                CGPoint(x: 300, y: 90),
                CGPoint(x: 350, y: 80),
                CGPoint(x: 392, y: 130),
                CGPoint(x: 50, y: 80),
                CGPoint(x: 90, y: 170),
                CGPoint(x: 150, y: 190),
                CGPoint(x: 350, y: 200),
                CGPoint(x: 300, y: 0),
                CGPoint(x: 5, y: 200),
                CGPoint(x: 50, y: 190),
                CGPoint(x: 100, y: 100),
                CGPoint(x: 150, y: 70),
                CGPoint(x: 290, y: 180),
                CGPoint(x: 330, y: 150),
                CGPoint(x: 300, y: 30)
            ]
            
            // Circles in the top quarter of the screen
            ForEach(0..<positions.count, id: \.self) { index in
                let size = CGFloat.random(in: 4...12) // Random sizes between 20 and 80
                let isTransparent = index % 3 == 0 // Make every third circle transparent
                
                Circle()
                    .fill(isTransparent ? Color.white.opacity(0.5) : Color.yellow) // Transparent or yellow
                    .frame(width: size, height: size) // Set size
                    .position(positions[index]) // Use predefined positions
            }
        }
        .edgesIgnoringSafeArea(.all) // Fill the entire screen
    }
}

struct Background2: View {
    var body: some View {
        ZStack {
            Background() // Use your custom background
            
            VStack {
                HStack {
                    // Back Button
                    Button(action: {
                        // Action for back button
                        print("Back button tapped")
                    }) {
                        Image(systemName: "arrow.left") // Use system back icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white) // Set color
                    }
                    .padding(.leading, 25) // Padding for the button
                    
                    Spacer() // To push the button to the left
                    
                }
                
                
                .padding(.bottom, 760) // Adjust top padding as needed
                 
            }
            VStack{
                Text("العنوان")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .padding(.bottom,585)
            }
            
        }
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct Background3: PreviewProvider {
    static var previews: some View {
        Background2()
    }
}
