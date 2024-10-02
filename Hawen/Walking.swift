




//
//  Walking.swift
//  t7project
//
//  Created by Nujud Abdullah on 27/03/1446 AH.
//

import SwiftUI

struct Walking: View {
    var body: some View {
        ZStack {
            
                
            // Full background color
            Color(hex: "0F133C") // Custom color using hex
            
            // Predefined positions for circles
            let positions = [
                CGPoint(x: 50, y: 10),
                CGPoint(x: 30, y: 100),
                CGPoint(x: 100, y: 70),
                CGPoint(x: 150, y: 120),
                CGPoint(x: 250, y: 190),
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
            

            // Circles in the background
            ForEach(0..<positions.count, id: \.self) { index in
                let size = CGFloat.random(in: 4...12) // Random sizes
                let isTransparent = index % 3 == 0 // Make every third circle transparent
                
                Circle()
                    .fill(isTransparent ? Color.white.opacity(0.5) : Color.yellow) // Transparent or yellow
                    .frame(width: size, height: size) // Set size
                    .position(positions[index]) // Use predefined positions
                Text("تمارين المشي")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(.bottom, 580)
                
            }
          
            
            
            VStack {
             
                
                
                // Audio options
                audioOption(title: "الصوت الأول", duration: "٣٠ دقائق") // First Audio
                audioOption(title: "الصوت الثاني", duration: "١٥ دقائق") // Second Audio
                audioOption(title: "الصوت الثالث", duration: "٧ دقائق") // Third Audio
            }
            .padding() // Adjust the top padding as necessary
        }
        .edgesIgnoringSafeArea(.all) // Fill the entire screen
    }

    // Helper function for audio options
    private func audioOption(title: String, duration: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 30))
                .padding(.leading, 20)
            
            Spacer() // Use Spacer to push elements to the sides
            
            Text(duration)
                .foregroundColor(.white)
                .font(.system(size: 15))
                .padding(.trailing, 10)

            Image(systemName: "headphones.circle.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .scaledToFit()
                .padding(.leading, 20)
        }
        .padding(.vertical, 10) // Vertical padding for each audio option
    }
}


#Preview {
    Walking()
}
