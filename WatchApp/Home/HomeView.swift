//
//  HomeView.swift
//  WatchApp
//
//  Created by Thomas Altenburger on 22.07.23.
//

import SwiftUI

struct HomeView: View {
    
    let appWidth = UIScreen.main.bounds.width
    let appHeight = UIScreen.main.bounds.height
    
    var body: some View {
        TabView {
            TimerViewUI()
            StopwatchViewUI()
        }.accentColor(.black)
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
