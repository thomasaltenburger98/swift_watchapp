//
//  StopwatchViewUI.swift
//  WatchApp
//
//  Created by Thomas Altenburger on 22.07.23.
//

import SwiftUI

struct StopwatchViewUI: View {
    
    @ObservedObject var stopwatchViewModel = StopwatchViewModel()
    
    var body: some View {
        generateStopwatchTabScreen()
    }
    
    func generateStopwatchTabScreen() -> some View {
        ZStack {
            Color.secondary_color.edgesIgnoringSafeArea([.top,.horizontal])
                    
            VStack {
                Text("\(formattedTime(stopwatchViewModel.stopwatchElapsedTime))")
                .font(.system(size: 60))
                .padding(.top, 50)
                    
                HStack {
                    Spacer()
                    if !stopwatchViewModel.stopwatchIsRunning {
                        Button(action: { stopwatchViewModel.startStopwatch() },
                               label: { Image(systemName: "arrowtriangle.right.fill").resizable().frame(width: 18, height: 18) })
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.main_secondary_color)
                            .background(Color.main_color).cornerRadius(25)
                        
                        /*Button("Start") {
                            stopwatchViewModel.startStopwatch()
                        }*/
                    } else {
                        Button(action: { stopwatchViewModel.stopStopwatch() },
                               label: { Image(systemName: "pause").resizable().frame(width: 18, height: 18) })
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.main_secondary_color)
                            .background(Color.main_color).cornerRadius(25)
                    }
                    Button(action: { stopwatchViewModel.resetStopwatch() },
                           label: { Image(systemName: "stop.fill").resizable().frame(width: 18, height: 18) })
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.main_secondary_color)
                        .background(Color.main_color).cornerRadius(25)
                    Spacer()
                }
                .font(.title)
                .padding(.bottom, 30)
            }
        }
        .tabItem {
            Image(systemName: "clock.fill")
            Text("Timer")
        }
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time * 10).truncatingRemainder(dividingBy: 10))
        return String(format: "%02d:%02d:%01d", minutes, seconds, milliseconds)
    }
    
}

struct StopwatchViewUI_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchViewUI()
    }
}
