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
            
            
            CustomBackground() // Use your custom background
                


            VStack{
                Text("ينبغي عليك محاولة النوم في أحد الأوقات التالية:")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 28))
                    .padding(.horizontal,15)
                    .background(Color.init(hex: "0F133C"))
                    .frame(width: 350, height: 100)
                
//                Text("Selected Time: \(formattedTime(selectedTime))") // Display selected time
//                                    .foregroundColor(.white)
//                                    .multilineTextAlignment(.center)
//                                    .font(.system(size: 28))
//                                    .padding(.horizontal, 15)
//                                    .background(Color(hex: "0F133C"))
//                                    .frame(width: 350, height: 100)
                
                ScrollView {
                    
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.init(hex: "261462"))
                                    .frame(width: 60, height: 60)
                                    .position(x: 330, y: 70)
                                Text("1")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .position(x: 330, y: 70)
                            }
                            Text("11:00 مساءً لمدة ست دورات  تسع ساعات من النوم.")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .position(x: -20, y: 70)
                                .multilineTextAlignment(.trailing)
                        }
                        .frame(height: 100)
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.init(hex: "261462"))
                                    .frame(width: 60, height: 60)
                                    .position(x: 330, y: 70)
                                Text("2")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .position(x: 330, y: 70)
                            }
                            Text("11:00 مساءً لمدة ست دورات  تسع ساعات من النوم.")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .position(x: -20, y: 70)
                                .multilineTextAlignment(.trailing)
                        }
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.init(hex: "261462"))
                                    .frame(width: 60, height: 60)
                                    .position(x: 330, y: 70)
                                Text("3")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .position(x: 330, y: 70)
                            }
                            Text("11:00 مساءً لمدة ست دورات  تسع ساعات من النوم.")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .position(x: -20, y: 70)
                                .multilineTextAlignment(.trailing)
                        }
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.init(hex: "261462"))
                                    .frame(width: 60, height: 60)
                                    .position(x: 330, y: 70)
                                Text("4")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .position(x: 330, y: 70)
                            }
                            Text("11:00 مساءً لمدة ست دورات  تسع ساعات من النوم.")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .position(x: -20, y: 70)
                                .multilineTextAlignment(.trailing)
                        }
                    }

                }
                
                Text("يرجى الأخذ في الاعتبار أن الإنسان العادي يستغرق أربعة عشر دقيقة للنوم، لذا خطط وفقًا لذلك!")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.horizontal,45)
                    .padding(.bottom,30)
            }.padding(.top,40)
            
        }
    }
    
    private func formattedTime(_ time: TimeSelection) -> String {
           let hour = time.isAM ? time.hour : (time.hour % 12) + 12
           let formatter = DateFormatter()
           formatter.dateFormat = "hh:mm a"
           let dateComponents = DateComponents(hour: hour+1, minute: time.minute)
           let date = Calendar.current.date(from: dateComponents) ?? Date()
           return formatter.string(from: date)
       }
}

//-------------------------------------------------------------------------------------------------------------

struct ContentView_PreviewsPage2: PreviewProvider {
    static var previews: some View {
        ContentViewPage2(selectedTime: TimeSelection(hour: 10, minute: 30, isAM: true))
    }
}

