//
//  TimerView.swift
//  WatchApp
//

import SwiftUI

struct TimerView: View {
    
    @Binding var progress: Double
    @Binding var duration: Double
    let gradientColors = [Color(hex: "C71FD6"), Color(hex: "DC8219"), Color(hex: "172EAA"), Color(hex: "E93D3D")]
    
    var body: some View {
        ZStack {
            BubbleView(size: 270, x: 0, y: 0)
            Circle().foregroundColor(Color.main_color).frame(width: 200, height: 200)
            if progress == 0 {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable().frame(width: 54, height: 60)
                    .foregroundColor(Color.main_secondary_color).offset(x: 5, y: 0)
            } else {
                Text(getSecondsToDuration(Int(duration))).modifier(MontserratFont(.bold, size: 30))
                    .foregroundColor(Color.main_secondary_color)
            }
            Circle()
                .trim(from: 0, to: CGFloat(progress) / 100)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [2, 15]))
                .fill(LinearGradient(gradient: .init(colors: gradientColors),
                                     startPoint: .topLeading, endPoint: .trailing))
                .animation(.spring()).frame(width: 325, height: 325)
        }
    }
}

struct TimerActionView: View {
    
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button(action: { viewModel.stopTimerButton() },
                       label: { Image(systemName: "stop.fill").resizable().frame(width: 18, height: 18) })
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.main_secondary_color)
                    .background(Color.main_color).cornerRadius(25)
                    .offset(x: viewModel.progress == 0 ? -1000 : 0, y: 0)
                Spacer()
                Button(action: { viewModel.timerActionButton() },
                       label: { Image(systemName: viewModel.timerActive ? "pause" : "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.main_secondary_color)
                    .background(Color.main_color).cornerRadius(25)
                    .offset(x: viewModel.progress == 0 ? 1000 : 0, y: 0)
            }.padding(75)
        }
    }
}

struct BubbleView: View {
    let size: CGFloat, x: CGFloat, y: CGFloat
    var body: some View {
        ZStack {
            Circle().foregroundColor(Color.bubble_color)
                .frame(width: size, height: size).offset(x: x, y: y)
        }
    }
}
