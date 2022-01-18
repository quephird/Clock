//
//  MinuteHandView.swift
//  Clock
//
//  Created by Danielle Kefford on 1/17/22.
//

import SwiftUI

struct MinuteHand: Shape {
    let minute: Int
    let second: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let centerX = rect.midX
        let centerY = rect.midY
        path.move(to: CGPoint(x: centerX, y: centerY))

        let angle = (Double(minute)*6.0 + Double(second)/10.0 - 90)*Double.pi/180.0
        let dx = 0.5*rect.maxX*cos(angle)
        let dy = 0.5*rect.maxY*sin(angle)
        path.addLine(to: CGPoint(x: rect.midX + dx, y: centerY + dy))

        return path
    }
}

struct MinuteHandView: View {
    @EnvironmentObject var currentTime: CurrentTime

    var body: some View {
        MinuteHand(minute: currentTime.minute, second: currentTime.second)
            .stroke(.black, lineWidth: 3)
    }
}
