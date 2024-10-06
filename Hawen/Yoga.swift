



import SwiftUI

struct Yoga: View {
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
                Text("أهلًا بك في عالم اليوغا")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(.bottom, 60.0)
                
                Text("قبل البدء باليوغا:")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.bottom, 500.0)
            }
                
                VStack {
                    
                    ScrollView {
                        Text("""
                    - قم بإختيار المكان المناسب: ابحث عن مكان مريح يساعدك على التركيز. يفضل ان يكون ما بين الطبيعة أو حتى في منزلك. 
                    
                    - البس ملابس ملائمة: قم بإرتداء ملابس مريحة تسمح لك بالحركة بسهولة. يفضل ان تكون ملابس قادرة على امتصاص العرق.
                    
                    - الإحماء: قبل البدء باليوغا، قم بتجهيز جسدك عن طريق الاحماء لتقليل خطر الإصابة.
                    
                    - تنفس بعمق: حاول التركيز على طريقة خروج ودخول الهواء وتطبيق تقنيات التنفس الصحيحة اثناء التمرين. 
                    
                    - ابدأ بالاساسيات: ابتعد عن الوضعيات المعقدة وابدأ بالتقنيات الأساسية والبسيطة.
                    
                    - استمع إلى جسدك: الهدف من اليوغا هو تعزيز الاسترخاء لذلك توقف عند الشعور بعدم الراحة.
                    
                    - خصص وقت ثابت للإنتظام: استمر على تمرين اليوغا بشكل يومي حتى وان كانت المدة قصيرة.
                    
                    - كن صبورًا: لا تتوقع النتائج بشكل فوري وكن صبورًا مع نفسك خلال هذه الرحلة.
                    
                    - استمتع بالعملية: استشعر اللحظة واعتبرها تجربة للتواصل مع ذاتك أكثر من انها مجرد تمرين.  
                    
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

// Preview
#Preview {
    Yoga()
}
