import SwiftUI

struct CustomBackgroundPage3: View {
    var body: some View {
        ZStack {
            Color(hex: "0F133C") // Custom color using hex code
            
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
                let size = CGFloat.random(in: 2...10)
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

//-------------------------------------------------------------------------------------------------------------

struct ContentViewPage3: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var currentTime: TimeSelection2

    init() {
        // Get the current time
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        let minute = calendar.component(.minute, from: now)
        let isAM = hour < 12
        
        // Adjust hour for 12-hour format
        let adjustedHour = hour % 12 == 0 ? 12 : hour % 12
        
        _currentTime = State(initialValue: TimeSelection2(hour: adjustedHour, minute: minute, isAM: isAM))
    }

    var body: some View {
        ZStack {
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .dynamicTypeSize(.xxLarge)
                        })
                    }
                })

            CustomBackgroundPage3() // Use your custom background
  
            VStack {
                Text("ينبغي عليك محاولة الاستيقاظ في أحد الأوقات التالية:")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28))
                    .padding(.horizontal, 15)
                    .background(Color(hex: "0F133C"))
                    .frame(width: 350, height: 100)
                
                ScrollView {
                    VStack {
                        // First time: Add 3 hours
                        let firstTime = addTime(currentTime, hours: 3, minutes: 0)
                        HStack {
                            Text("دورتان من النوم، لمده ثلاث ساعات")
                                .foregroundColor(.white)

                            displayTime(index: 1, time: firstTime)
                        }.padding(.trailing, 20)

                        // Second time: Add 4 hours and 30 minutes
                        let secondTime = addTime(currentTime, hours: 4, minutes: 30)
                        HStack {
                            Text("ثلاث دورات من النوم، لمده اربع ساعات ونصف")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top, 25)
                            
                            displayTime(index: 2, time: secondTime)
                        }

                        // Third time: Add 6 hours
                        let thirdTime = addTime(currentTime, hours: 6, minutes: 0)
                        HStack {
                            Text("اربع دورات من النوم، لمده سته ساعات من النوم")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top, 25)
                            
                            displayTime(index: 3, time: thirdTime)
                                .padding(.trailing, 25)
                        }

                        // Fourth time: Add 7 hours and 30 minutes
                        let fourthTime = addTime(currentTime, hours: 7, minutes: 30)
                        HStack {
                            Text("خمس دورات من النوم، لمده سبع ساعات ونصف")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top, 25)
                            
                            displayTime(index: 4, time: fourthTime)
                        }
                        // fifth time: Add 9 hours
                        let fifthTime = addTime(currentTime, hours: 9, minutes: 0)
                        HStack {
                            Text("ستة دورات من النوم، لمده تسع ساعات ")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                //.padding(.top, 25)
                            
                            displayTime(index: 5, time: fifthTime)
                        }
                        // sixth time: Add 10 hours and 30 minutes
                        let sixthTime = addTime(currentTime, hours: 10, minutes: 30)
                        HStack {
                            Text("سبعة دورات من النوم، لمده عشر ساعات ونصف")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.top, 25)
                            
                            displayTime(index: 6, time: sixthTime)
                        }
                        
                
                    }
                }
            }
            .padding(.top, 40)
        }
    }

    // Function to add hours and minutes to a given time
    private func addTime(_ time: TimeSelection2, hours: Int, minutes: Int) -> TimeSelection2 {
        var newHour = time.hour + hours
        var newMinute = time.minute + minutes
        
        // Adjust minutes
        if newMinute >= 60 {
            newHour += newMinute / 60
            newMinute = newMinute % 60
        }

        // Adjust hour to be in the range of 1-12
        newHour = ((newHour - 1) % 12) + 1
        
        return TimeSelection2(hour: newHour, minute: newMinute, isAM: time.isAM)
    }

    // Helper function to display the time
    private func displayTime(index: Int, time: TimeSelection2) -> some View {
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
            .padding(.leading, 5)
        }
        .frame(height: 100)
    }
}

// Example TimeSelection struct
struct TimeSelection2 {
    var hour: Int
    var minute: Int
    var isAM: Bool
}

// Preview provider
struct ContentView_PreviewsPage3: PreviewProvider {
    static var previews: some View {
        ContentViewPage3()
    }
}
