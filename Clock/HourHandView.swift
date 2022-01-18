//
//  HourHandView.swift
//  Clock
//
//  Created by Danielle Kefford on 1/17/22.
//

import SwiftUI

struct HourHand: Shape {
    let hour: Int
    let minute: Int
    let second: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let centerX = rect.midX
        let centerY = rect.midY
        path.move(to: CGPoint(x: centerX, y: centerY))

        let angle = (Double(hour)*30.0 + Double(minute)/2.0 - 90.0)*Double.pi/180.0
        let dx = 0.3*rect.maxX*cos(angle)
        let dy = 0.3*rect.maxY*sin(angle)
        path.addLine(to: CGPoint(x: rect.midX + dx, y: centerY + dy))

        return path
    }
}

struct HourHandView: View {
    @EnvironmentObject var currentTime: CurrentTime

    var body: some View {
        HourHand(hour: currentTime.hour, minute: currentTime.minute, second: currentTime.second)
            .stroke(.black, lineWidth: 6)
    }
}
