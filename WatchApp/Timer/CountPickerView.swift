//
//  CountPickerView.swift
//  WatchApp
//

import SwiftUI

struct CountPickerView: View {
    
    @ObservedObject var viewModel: TimerViewModel
    @State var hoursIndex = 0
    @State var minsIndex = 0
    @State var secsIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: { viewModel.dismissPickerSheet() }, label: {
                                Image(systemName: "xmark")
                                    .resizable().frame(width: 12, height: 12)
                                    .font(Font.title.weight(.bold))
                           })
                        .frame(width: 32, height: 32).foregroundColor(Color.white)
                        .background(Color(hex: "ffffff", alpha: 0.5)).cornerRadius(25)
                }.padding(.top, 10)
                HStack(alignment: .center, spacing: 16) {
                    GenPickerView(label: "Hours", values: 24, index: $hoursIndex)
                    GenPickerView(label: "Minutes", values: 60, index: $minsIndex)
                    GenPickerView(label: "Seconds", values: 60, index: $secsIndex)
                }
                Button(action: { viewModel.startTimerButt(hours: hoursIndex, mins: minsIndex, secs: secsIndex) },
                       label: { Image(systemName: "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.main_secondary_color)
                    .background(Color.main_color).cornerRadius(25)
                    .padding(.bottom, 30)
            }
            .padding(16).padding(.bottom, 32)
            .frame(maxWidth: .infinity)
            .background(Color.dark_color)
            .cornerRadius(32)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct GenPickerView: View {
    
    var label: String, values: Int
    @Binding var index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(label).modifier(MontserratFont(.regular, size: 16))
                .foregroundColor(Color.text_primary_color)
            Picker(selection: $index, label: Text("")) {
                ForEach(0..<values) { i in
                    Text("\(i)").modifier(MontserratFont(.regular, size: 16))
                        .foregroundColor(Color.main_secondary_color).frame(width: 35)
                        .background(Color.main_color).cornerRadius(8)
                }
            }.frame(maxWidth: 100).clipped()
        }
    }
}
