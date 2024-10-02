import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ProjectMainPage1()
                .navigationBarHidden(true) // Hide navigation bar for a cleaner look
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures proper navigation on all devices
    }
}

struct ProjectMainPage1: View {
    @State private var selectedDate: Int? = nil
    @State private var selectedEmoji: String? = nil
    @State private var emojiOnDate: [Int: (emoji: String, timestamp: Date)] = [:]

    var body: some View {
        ZStack {
            // Custom Background
            Color(hex: "0F133C").ignoresSafeArea()

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

            // Background Circles
            ForEach(0..<positions.count, id: \.self) { index in
                let size = CGFloat.random(in: 4...12)
                let isTransparent = index % 3 == 0

                Circle()
                    .fill(isTransparent ? Color.white.opacity(0.5) : Color.yellow)
                    .frame(width: size, height: size)
                    .position(positions[index])
            }

            // Main Content
            VStack {
                // Welcome Text
                Text("مرحباً بك")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .padding(.top, 60)
                    .padding(.bottom, 40)

                // Horizontal ScrollView with buttons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: ContentViewS()) {
                            ButtonView(title: "النوم", iconName: "moon.fill")
                        }
                        NavigationLink(destination: MeditationView()) {
                            ButtonView(title: "التأمل", iconName: "leaf.fill")
                        }
                        NavigationLink(destination: Maram()) {
                            ButtonView(title: "التنفس", iconName: "wind")
                        }
                        NavigationLink(destination: PageFourView()) {
                            ButtonView(title: "التركيز", iconName: "eye.fill")
                        }
                        NavigationLink(destination: Nujud()) {
                            ButtonView(title: "الجسدي", iconName: "figure.walk")
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)

                // Mood Question
                Text("كيف مزاجك اليوم؟")
                    .font(.title2)
                    .foregroundColor(.white)

                // Mood emojis
                HStack(spacing: 20) {
                    ForEach(["🥰", "😊", "😐", "😢", "😠"], id: \.self) { emoji in
                        Button(action: {
                            if let selectedDate = selectedDate {
                                if canUpdateMood(for: selectedDate) {
                                    emojiOnDate[selectedDate] = (emoji, Date())
                                    selectedEmoji = emoji
                                } else {
                                    // Inform the user they cannot update the mood
                                    print("You can only update the mood for tomorrow.")
                                }
                            }
                        }) {
                            Text(emoji)
                                .font(.largeTitle)
                        }
                    }
                }
                .padding(.bottom, 5)

                // Calendar
                CalendarView(selectedDate: $selectedDate, emojiOnDate: emojiOnDate)
                    .padding(.horizontal, 20)
            }
        }
    }

    private func canUpdateMood(for date: Int) -> Bool {
        if let moodEntry = emojiOnDate[date] {
            let timeSinceLastUpdate = Date().timeIntervalSince(moodEntry.timestamp)
            return timeSinceLastUpdate > 86400 // 24 hours in seconds
        }
        return true // Allow mood setting for the first time
    }
}

// Reusable Button View with Icon
struct ButtonView: View {
    var title: String
    var iconName: String

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)

            Text(title)
                .font(.title3)
        }
        .frame(width: 95, height: 150)
        .background(Color(hex: "#24145E"))
        .foregroundColor(.white)
        .cornerRadius(50)
    }
}

// Placeholder Pages
struct SleepView: View {
    var body: some View {
        Text("النوم")
            .font(.largeTitle)
    }
}

struct MeditationView: View {
    var body: some View {
        Text("التأمل")
            .font(.largeTitle)
    }
}

struct BreathingView: View {
    var body: some View {
        Text("التنفس")
            .font(.largeTitle)
    }
}

struct PageFourView: View {
    var body: some View {
        Text("التركيز")
            .font(.largeTitle)
    }
}

struct PageFiveView: View {
    var body: some View {
        Text("التمارين الحركية")
            .font(.largeTitle)
    }
}

// Calendar View
struct CalendarView: View {
    let daysInWeek = ["ح", "ن", "ث", "ع", "خ", "ج", "س"]
    let daysInMonth: [String] = {
        var days = [String]()
        for day in 1...30 {
            days.append("\(day)")
        }
        return days
    }()

    @Binding var selectedDate: Int?
    var emojiOnDate: [Int: (emoji: String, timestamp: Date)]

    var body: some View {
        VStack {
            Text("هذا الشهر")
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 20.0)

            // Days of the week
            HStack {
                ForEach(daysInWeek, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }

            // Days of the month
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(daysInMonth.indices, id: \.self) { index in
                    let day = index + 1
                    let emoji = emojiOnDate[day]?.emoji ?? ""
                    Button(action: {
                        selectedDate = day
                    }) {
                        ZStack {
                            Text("\(day)")
                                .frame(width: 40, height: 40)
                                .background(Color(hex: "#24145E"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .padding(2)

                            if !emoji.isEmpty {
                                Text(emoji)
                                    .font(.largeTitle)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .padding()
        .background(Color(hex: "#0F133C").opacity(0.8))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
