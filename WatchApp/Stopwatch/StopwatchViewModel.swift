//
//  StopwatchViewModel.swift
//  WatchApp
//
//  Created by Thomas Altenburger on 22.07.23.
//

import Foundation
import Combine

class StopwatchViewModel: ObservableObject {
    
    var stopwatchTimer: AnyCancellable?
        
    @Published var stopwatchElapsedTime: TimeInterval = 0
    @Published var stopwatchIsRunning = false
    
    init() {}

    func startStopwatch() {
        if !stopwatchIsRunning {
            stopwatchIsRunning = true
            stopwatchTimer = Timer.publish(every: 0.1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    self.stopwatchElapsedTime += 0.1
                }
        }
    }

    func stopStopwatch() {
        stopwatchIsRunning = false
        stopwatchTimer?.cancel()
        stopwatchTimer = nil
    }

    func resetStopwatch() {
        stopwatchElapsedTime = 0
        stopStopwatch()
    }
}
