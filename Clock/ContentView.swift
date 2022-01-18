//
//  ContentView.swift
//  Clock
//
//  Created by Danielle Kefford on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var currentTime = CurrentTime()

    var body: some View {
        ZStack {
            ClockFaceView()
            HourHandView()
            MinuteHandView()
            SecondHandView()
        }
        .frame(width: 300, height: 300)
        .environmentObject(currentTime)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
