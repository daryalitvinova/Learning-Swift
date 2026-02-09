//
//  Timers.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 07.02.2026.
//

import SwiftUI
import Combine

struct Timers: View {
    // autoconnect, т.е. начинает публиковать как только создастся вью
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // currentTime
    //@State var currentDate: Date = Date()
    
    //Countdown
    //@State var count: Int = 10
    //@State var finishedText: String? = nil
    
    // Countdown to date
    /*@State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        
        timeRemaining = "\(hour):\(minute):\(second)"
    }*/
    
    // Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            //Text("\(currentDate.description)")
            //Text(finishedText ?? "\(count)")
            /*Text("\(timeRemaining)")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)*/
            
            /*HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundStyle(.white)*/
            
            TabView(selection: $count,
                    content: {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.pink)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.indigo)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { value in
            //currentDate = value
            
            /*if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }*/
            
            //updateTimeRemaining()
            
//            withAnimation(.easeInOut(duration: 1.0)) {
//                count = count == 3 ? 0 : count + 1
//            }
            
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        }
    }
}

#Preview {
    Timers()
}
