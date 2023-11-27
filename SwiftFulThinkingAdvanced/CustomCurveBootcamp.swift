//
//  CustomCurveBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 27/11/2566 BE.
//

import SwiftUI

struct CustomCurveBootcamp: View {
    var body: some View {
        ArcSample()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCurveBootcamp()
}

struct ArcSample: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}

struct ShapeWithArc: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            
        }
    }
}
