import SwiftUI

struct Maram: View {
    struct Background: View {
        var body: some View {
            ZStack {
                Color(hex: "0F133C")
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
                ForEach(0..<positions.count, id: \.self) { index in
                    let size = CGFloat.random(in: 3...12)
                    let isTransparent = index % 3 == 0
                    
                    Circle()
                        .fill(isTransparent ? Color.white.opacity(0.5) : Color.yellow)
                        .frame(width: size, height: size)
                        .position(positions[index])
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    struct Background2: View {
        @State private var startAnimation = false
        @State private var isAnimating = false
        @State private var showInhaleText = false
        @State private var showHoldText = false
        @State private var showExhaleText = false
        @State private var countdownText = "4"
        @State private var currentInstruction = "شهيق" // New state for current instruction
        
        @State private var isFlowerFormed = false // Track when the flower is formed
        
        private let inhaleDuration: Double = 4.0
        private let holdDuration: Double = 7.0
        private let exhaleDuration: Double = 8.0
        
        var body: some View {
            ZStack {
                Background()

                VStack {
                    HStack {
                        Button(action: {
                            print("Back button tapped")
                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 25)
                        
                        Spacer()
                    }
                    .padding(.bottom, 760)
                    
                    Spacer()

                    Button(action: {
                        if !isAnimating {
                            formFlower() // Start by forming the flower
                        }
                    }) {
                        Text("إبدأ التمرين")
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .offset(y: -50)
                    
                }
                .zIndex(1)
                
                VStack {
                    Text("تنفّس")
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                        .offset(y: -300)
                }
                
                VStack(spacing: 20) {
                    ZStack {
                        // Start as one circle and transition to the flower shape
                        if !isFlowerFormed {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 100, height: 100)
                        } else {
                            // Once flower is formed, animate the petals expanding and contracting
                            ForEach(0..<3, id: \.self) { circleSetNumber in
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 100, height: 100)
                                        .offset(y: startAnimation ? 50 : 50) // Animated offset
                                    
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .bottom, endPoint: .top))
                                        .frame(width: 100, height: 100)
                                        .offset(y: startAnimation ? -50 : -50) // Animated offset
                                }
                                .opacity(0.5)
                                .rotationEffect(.degrees(startAnimation ? Double(circleSetNumber * 60) : 0))
                            }
                        }
                    }
                    
                    // Instructions text and countdown
                    VStack {
                        Text(currentInstruction)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .transition(.opacity) // Smooth transition for instruction text
                            .animation(.easeInOut, value: currentInstruction) // Animate when current instruction changes
                        
                        Text(countdownText) // Countdown number
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                    }
                    .offset(y: 55) // Move instructions down a bit
                }
                .offset(y: 50)
            }
        }
        
        // Step 1: Form the flower from a single circle
        private func formFlower() {
            isAnimating = true
            
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                isFlowerFormed = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                startBreathingAnimation() // Start breathing after the flower is formed
            }
        }
        
        // Step 2: Breathing cycle animations with countdowns and instructions
        private func startBreathingAnimation() {
            // Inhale Phase
            showInhaleText = true
            updateCountdown(for: inhaleDuration) // Start countdown for inhale
            currentInstruction = "شهيق"
            
            // Inhale animation
            withAnimation(Animation.easeInOut(duration: inhaleDuration)) {
                startAnimation = true // Expand the flower (adjusting offset, not scale)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + inhaleDuration) {
                showInhaleText = false
                showHoldText = true
                updateCountdown(for: holdDuration) // Countdown for hold
                currentInstruction = "امسك نفسك..."
                
                DispatchQueue.main.asyncAfter(deadline: .now() + holdDuration) {
                    showHoldText = false
                    showExhaleText = true
                    updateCountdown(for: exhaleDuration) // Countdown for exhale
                    currentInstruction = "زفير"

                    // Exhale animation
                    withAnimation(Animation.easeInOut(duration: exhaleDuration)) {
                        startAnimation = false // Contract the flower (adjusting offset back)
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + exhaleDuration) {
                        showExhaleText = false
                        isAnimating = false
                        formFlower() // Continue the cycle after forming the flower again
                    }
                }
            }
        }
        
        // Countdown function
        private func updateCountdown(for duration: Double) {
            var secondsLeft = Int(duration)
            countdownText = "\(secondsLeft)" // Start countdown

            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                secondsLeft -= 1
                countdownText = "\(secondsLeft)"
                
                if secondsLeft <= 0 {
                    timer.invalidate() // Stop timer
                }
            }
        }
    }

    var body: some View {
        Background2()
    }
}

#Preview {
    Maram()
}
