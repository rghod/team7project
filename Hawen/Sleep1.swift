//
//  Sleep1.swift
//  t7project
//
//  Created by Rand Soliman Alobaid on 29/03/1446 AH.
//

import SwiftUI

struct CustomBackground: View {
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

struct ContentViewS: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var selectedTime = TimeSelection(hour: Calendar.current.component(.hour, from: Date()) % 12, minute: Calendar.current.component(.minute, from: Date()), isAM: true)
    
    var body: some View {
        NavigationView {
            ZStack {
                CustomBackground() // Use your custom background
                
                VStack {
                    
                    //back navigation
                    Spacer()
                    .navigationBarBackButtonHidden(true)
                    .toolbar(content: {
                    ToolbarItem (placement: .navigationBarLeading)  {
                    Button(action: {
                                       presentationMode.wrappedValue.dismiss()
                    }, label: {
                    Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .dynamicTypeSize(.xxLarge)
                        
                    })
                    }
                    })
                    //back navigation

                    
                    
                    Text("متى تريد أن تستيقظ؟")
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                        .padding(.top, 20)
                    
                    
                    // Integrate ContentView2 here
                    ContentView2(selectedTime: $selectedTime)
                    
                    
                    NavigationLink(destination: ContentViewPage2(selectedTime: selectedTime)) {
                        Image("Rectangle") // Use the image named "Rectangle"
                            .resizable() // Make the image resizable
                            .frame(width: 350, height: 60) // Set button size
                            .cornerRadius(30) // Rounded corners
                            .overlay(
                                Text("حساب وقت النوم") // Optional label over the image
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                    }
                
                                  
                    Text("إذا كنت تريد الذهاب إلى السرير الآن...")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding(.top, 70)
                    
                    
                    NavigationLink(destination: ContentViewPage3()) {
                                           Image("Rectangle")
                                               .resizable()
                                               .frame(width: 350, height: 60)
                                               .cornerRadius(30)
                                               .overlay(
                                                   Text("حساب وقت الاستيقاظ")
                                                       .font(.headline)
                                                       .foregroundColor(.white)
                                               )
                                       }
                    .padding(.bottom, 75)
                    .padding(.top, 10)
                    
                    
                    Spacer() // Add spacer to push content upwards
                }
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------------------

struct ContentView2: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @Binding var selectedTime: TimeSelection
    
//    @State private var selectedHour = Calendar.current.component(.hour, from: Date()) % 12
//    @State private var selectedMinute = Calendar.current.component(.minute, from: Date())
//    @State private var isAM = true // Track AM/PM
    

    var body: some View {
        VStack {
            HStack {
                Picker("Hour", selection: $selectedTime.hour) { // الساعات لازم ازيدها ١ عشان يضبط الوقت
                    ForEach(1..<13) { hour in
                        Text("\(hour)").foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100) // Set width for layout
                
                Picker("Minute", selection: $selectedTime.minute) {
                    ForEach(0..<60) { minute in
                        Text("\(minute < 10 ? "0\(minute)" : "\(minute)")").foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100) // Set width for layout
                
                Picker("AM/PM", selection: $selectedTime.isAM) {
                    Text("AM").foregroundColor(.white).tag(true)
                    Text("PM").foregroundColor(.white).tag(false)
                }
                .pickerStyle(WheelPickerStyle()) // Make it scrollable
                .frame(width: 80) // Set width for layout
            }
            .padding()
            .background(Color.clear) // Clear background for the pickers

//            Text("Selected Time: \(formattedTime(selectedTime.hour+1, selectedTime.minute, selectedTime.isAM))")
//                .font(.headline)
//                .foregroundColor(.white)

            Spacer()
        }
        .padding()
    }

    private func formattedTime(_ hour: Int, _ minute: Int, _ isAM: Bool) -> String {
        let actualHour = isAM ? hour : (hour % 12) + 12 // Convert to 24-hour format
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let dateComponents = DateComponents(hour: actualHour, minute: minute)
        let date = Calendar.current.date(from: dateComponents) ?? Date()
        return formatter.string(from: date)
    }
}

//-------------------------------------------------------------------------------------------------------------

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentViewS()
    }
}
