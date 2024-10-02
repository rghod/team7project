//
//  midtation.swift
//  t7project
//
//  Created by Raghad  on 28/03/1446 AH.
//

import SwiftUI

// Custom background view
struct CustomBackgroundP: View {
    var body: some View {
        ZStack {
            // Full background color using a custom hex code
            Color(hex: "0F133C").ignoresSafeArea()
            
            // Predefined positions for circles with closer spacing and lower placement
            let positions = [
                CGPoint(x: 50, y: 10),
                CGPoint(x: 30, y: 100),
                CGPoint(x: 100, y: 70),
                CGPoint(x: 150, y: 120),
                CGPoint(x: 250, y: 190), // النقطة القريبة للعنوان
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
    }
}

// Main content view
struct ContentViewP: View {
    var body: some View {
        ZStack {
            // Custom background view
            CustomBackgroundP()
            
            // Content Stack
            VStack {
                // Header with back button
                HStack {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 24)
                            .foregroundColor(.white)
                    }
                    
                    
                    Spacer() // Pushes the back button to the left
                }
                .padding(.top, 40)
                
                // Title
                Text("التأمل")
                    .font(.largeTitle)
                    .fontWeight(.none)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .padding(.leading, 185)
                
                // List view for meditation options
                ListView()
                
                Spacer() // Adds space at the bottom
            }
            .padding()
            .edgesIgnoringSafeArea(.all) // Full-screen background
        }
    }
    
    // List view for meditation options
    struct ListView: View {
        var body: some View {
            VStack(spacing: 20) {
                // Manually defined items
                itemView(for: "الضوضاء البيضاء", duration: "٥ دقائق")
                itemView(for: "الضوضاء البنية", duration: "٥ دقائق")
                itemView(for: "الضوضاء السوداء", duration: "٥ دقائق")
                itemView(for: "موجات الألفا", duration: "٥ دقائق")
                
            }
            .padding(.horizontal)
            
        }
        
        // A function to create a view for each item
        private func itemView(for item: String, duration: String) -> some View {
            HStack {
                // Question icon
                Image(systemName: "questionmark.circle")
                    .foregroundColor(.white)
                
                Spacer()
                
                // Item description and duration
                VStack(alignment: .leading) {
                    Text(item)
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .padding(.leading, 40)
                    
                    Text(duration)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.leading, 160)
                }
                
                Spacer()
                
                // Headphones icon
                Image(systemName: "headphones.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 75, height: 75) // Set the desired frame size
                    .scaledToFit()
            }
        }
    }
    
    // Preview struct
 
          
        }
    

          
        
#Preview(body: {
    ContentViewP()
})
    

