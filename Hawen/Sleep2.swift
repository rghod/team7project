//
//  Sleep2.swift
//  t7project
//
//  Created by Rand Soliman Alobaid on 29/03/1446 AH.
//

import SwiftUI

struct CustomBackgroundPage2: View {
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
                CGPoint(x: 90, y: 70), //
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
                let size = CGFloat.random(in: 3...11) // Random sizes
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

//-------------------------------------------------------------------------------------------------------------

struct ContentViewPage2: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var selectedTime: TimeSelection // Store the selected time

    var body: some View {
        ZStack {
            CustomBackgroundPage2() // Your custom background
            
            VStack {
                Text("ينبغي عليك محاولة النوم في أحد الأوقات التالية:")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28))
                    .padding(.horizontal, 15)
                    .background(Color(hex: "0F133C"))
                    .frame(width: 350, height: 100)
                
                ScrollView {
                    VStack {
                        // First time: Add 3 hours
                        let firstTime = addTime(selectedTime, hours: 4, minutes: 0)
                        HStack {
                            Text("دورتان من النوم، لمده ثلاث ساعات")
                                .foregroundColor(.white)

                            displayTime(index: 1, time: firstTime)
                        }.padding(.trailing,20);

                        // Second time: Add 4 hours and 30 minutes
                        let secondTime = addTime(selectedTime, hours: 5, minutes: 30)
                        HStack {
                            Text("ثلاث دورات من النوم، لمده اربع ساعات ونصف")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top,25)
                            
                            displayTime(index: 2, time: secondTime)
                        };

                        // Third time: Add 6 hours
                        let thirdTime = addTime(selectedTime, hours: 7, minutes: 0)
                        
                        HStack {
                            Text("اربع دورات من النوم، لمده سته ساعات من النوم")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top,25)
                            
                            displayTime(index: 3, time: thirdTime)
                                .padding(.trailing,30)
                        };
                        

                        // Fourth time: Add 7 hours and 30 minutes
                        let fourthTime = addTime(selectedTime, hours: 8, minutes: 30)
                        HStack {
                            Text("خمس دورات من النوم، لمده سبع ساعات ونصف")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top,25)
                            
                            displayTime(index: 4, time: fourthTime)
                        };

                    }
                }

                Text("يرجى الأخذ في الاعتبار أن الإنسان العادي يستغرق أربعة عشر دقيقة للنوم، لذا خطط وفقًا لذلك!")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.horizontal, 45)
                    .padding(.bottom, 30)
            }
            .padding(.top, 40)
        }
    }

    // Function to add hours and minutes to a given time
    private func addTime(_ time: TimeSelection, hours: Int, minutes: Int) -> TimeSelection {
        var newHour = time.hour + hours
        var newMinute = time.minute + minutes
        
        // Adjust minutes
        if newMinute >= 60 {
            newHour += newMinute / 60
            newMinute = newMinute % 60
        }

        // Adjust hour to be in the range of 1-12
        newHour = ((newHour - 1) % 12) + 1
        
        return TimeSelection(hour: newHour, minute: newMinute, isAM: time.isAM)
    }

    // Helper function to display the time
    private func displayTime(index: Int, time: TimeSelection) -> some View {
        HStack {
            Text("\(time.hour):\(String(format: "%02d", time.minute))")
                .foregroundColor(.white)
                .font(.system(size: 17))
                .multilineTextAlignment(.trailing)
            ZStack {
                Circle()
                    .fill(Color(hex: "261462"))
                    .frame(width: 55, height: 55)
                Text("\(index)")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            .padding(.leading,5)
        }
        .frame(height: 100)
    }
}


// Preview provider
struct ContentView_PreviewsPage2: PreviewProvider {
    static var previews: some View {
        ContentViewPage2(selectedTime: TimeSelection(hour: 10, minute: 30, isAM: true))
    }
}
