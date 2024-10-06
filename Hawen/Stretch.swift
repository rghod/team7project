

//  Stretch.swift
//  t7project
//
//  Created by Nujud Abdullah on 27/03/1446 AH.
//

import SwiftUI

struct Stretch: View {
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
            }

            VStack {
                Text("أهلًا بك في عالم التمدد")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(.bottom, 60.0)
                
                Text("قبل البدء بتمارين التمدد:")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.bottom, 500.0)
            }
                
                VStack {
                    
                    ScrollView {
                        Text("""
                    - اختر الوقت المناسب: يفضل ممارسة التمدد بعد التمارين الرياضية أو في الصباح. 
                    
                    - حدد المناطق المستهدفة: حدد المناطق التي ترغب في تمددها وقم بالتمرين المناسب لكل منطقة. 
                    
                    - احمِ جسمك: ابدأ بالإحماء أولًا لتسخين عضلاتك. 
                    
                    - ركز على الوضعيات الصحيحة: لتجنب الإصابات والحصول على أفضل النتائج تأكد من ان وضعية جسدك صحيحة.
                    
                    - تنفس بعمق: تنفس بعمق وإنتظام خلال التمدد لزيادة تدفق الدم إلى عضلاتك.
                    
                    - استمع لجسدك: يجب ان يكون التمدد مريح لذلك إذا شعرت ببعض من الآلم توقف فورًا عن التمدد. 
                    
                    - تمرن ببطئ: قم بتمارين التمدد ببطئ لتجنب الشد العضلي.
                    
                    - خصص وقت ثابت للإنتظام: استمر على تمرين التمدد بشكل يومي حتى وان كانت المدة قصيرة.
                    
                    - استمتع بالعملية: استمتع بالتجربة واعتبر تمارين التمدد جزء أساسي من يومك للاسترخاء والتخلص من التوتر. 
                    
                    """)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.trailing)
                        .padding(.bottom, 10.0)
                    }
                
                    .padding(.top, 300.0)
            }
            .padding(.horizontal) // Horizontal padding for alignment
        }
        .edgesIgnoringSafeArea(.all) // Fill the entire screen
    }
}



#Preview {
    Stretch()
}
