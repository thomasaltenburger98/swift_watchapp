//
//  TimerViewUI.swift
//  WatchApp
//
//  Created by Thomas Altenburger on 22.07.23.
//

import SwiftUI

struct TimerViewUI: View {
    
    @ObservedObject var timerViewModel = TimerViewModel()
    
    var body: some View {
        generateTimerTabScreen()
    }
    
    func generateTimerTabScreen() -> some View {
        ZStack {
            Color.secondary_color.edgesIgnoringSafeArea([.top,.horizontal])
            Group {
                Button(action: { timerViewModel.displayPickerSheet() }, label: { TimerView(progress: $timerViewModel.progress, duration: $timerViewModel.duration) })
                TimerActionView(viewModel: timerViewModel)
            }
            .blur(radius: timerViewModel.showPickerSheet ? 15 : 0)
            CountPickerView(viewModel: timerViewModel).offset(x: 0, y: timerViewModel.showPickerSheet ? 0 : 1500)
        }.animation(.spring())
            .tabItem {
                Image(systemName: "timer.circle.fill")
                Text("List")
            }
    }
    
}


struct TimerViewUI_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewUI()
    }
}
