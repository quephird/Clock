//
//  CurrentTime.swift
//  Clock
//
//  Created by Danielle Kefford on 1/17/22.
//

import Foundation

class CurrentTime: ObservableObject {
    @Published var second = 0
    @Published var minute = 0
    @Published var hour = 0

    var timer: Timer?

    init() {
        let calendar = Calendar.current
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.second = calendar.component(.second, from: timer.fireDate)
            self.minute = calendar.component(.minute, from: timer.fireDate)
            self.hour = calendar.component(.hour, from: timer.fireDate)
        }
    }
}
