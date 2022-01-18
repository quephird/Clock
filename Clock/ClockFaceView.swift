//
//  ClockFaceView.swift
//  Clock
//
//  Created by Danielle Kefford on 1/17/22.
//

import SwiftUI

struct MinuteMarker: Shape {
    let minute: Int

    func path(in rect: CGRect) -> Path {
        let angle = (Double(minute)*6.0-90)*Double.pi/180.0
        let r = 0.98*rect.midX
        var x = r*cos(angle)
        var y = r*sin(angle)
        let dx = (minute%5==0 ? 0.1 : 0.05)*x
        let dy = (minute%5==0 ? 0.1 : 0.05)*y
        x = x+rect.midX
        y = y+rect.midY

        var path = Path()

        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x-dx, y: y-dy))

        return path
    }
}

struct HourLabel: View {
    var hour: Int
    var x: Double
    var y: Double

    var body: some View {
        Text("\(hour)")
            .position(x: x, y: y)
            .font(.title)
    }

    init(hour: Int) {
        self.hour = hour
        let angle = (Double(hour)*30.0-90)*Double.pi/180.0
        x = 150 + 120*cos(angle)
        y = 150 + 120*sin(angle)
    }
}

struct ClockFaceView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 10)

            ForEach(0..<60, id: \.self) { minute in
                MinuteMarker(minute: minute)
                    .stroke(.black, lineWidth: 3)
            }

            ForEach(1...12, id: \.self) { hour in
                HourLabel(hour: hour)
            }
        }
    }
}

struct ClockFaceView_Previews: PreviewProvider {
    static var previews: some View {
        ClockFaceView()
    }
}
