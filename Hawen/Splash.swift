//
//  Splash.swift
//  t7project
//
//  Created by Nujud Abdullah on 27/03/1446 AH.
//

import SwiftUI

struct Splash: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 1.0
   // @State private var opacity: Double = 1.0
    private let duration: Double = 2.0
    
    var body: some View {
        if isActive{
            ContentView()
        } else {
            ZStack{
                Color(hex: "0F133C")
                    .ignoresSafeArea()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration)
                        {
                            withAnimation {
                                isActive = true
                            }
                        }                   }
                VStack{
                    Image("Hon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(300)
                        .scaleEffect(scale)
                      //  .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeIn(duration: 1.5)) {
                                scale = 1.2
                          //      opacity = 0.0
                                         
                            }
                        
                                
                            }
                    Text(" الجانب المشرق من يومك ")
                        .foregroundStyle(Color(hex: "#8474B7"))
                        .font(.title2)
                        .fontWeight(.regular)
                    
                        }
                        .padding()
                    
                    
                }
            }
        }
    }


#Preview {
    Splash()
}
