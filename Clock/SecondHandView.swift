//
//  SecondHand.swift
//  Clock
//
//  Created by Danielle Kefford on 1/17/22.
//

import SwiftUI

struct SecondHand: Shape {
    let second: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let centerX = rect.midX
        let centerY = rect.midY
        path.move(to: CGPoint(x: centerX, y: centerY))

        let angle = (Double(second)*6.0-90.0)*Double.pi/180.0
        let dx = 0.5*rect.maxX*cos(angle)
        let dy = 0.5*rect.maxY*sin(angle)
        path.addLine(to: CGPoint(x: rect.midX + dx, y: centerY + dy))

        return path
    }
}

struct SecondHandView: View {
    @EnvironmentObject var currentTime: CurrentTime

    var body: some View {
        SecondHand(second: currentTime.second)
            .stroke(Color(hue: 1.0, saturation: 1.0, brightness: 1.0), lineWidth: 1)
    }
}
