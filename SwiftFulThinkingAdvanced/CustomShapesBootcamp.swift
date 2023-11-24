//
//  CustomShapesBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 24/11/2566 BE.
//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

struct CustomShapesBootcamp: View {
    var body: some View {
        ZStack{
//            Triangle()
//                .trim(from: 0, to: 0.5)
//                .fill(LinearGradient(colors: [.red,.blue], startPoint: .leading, endPoint: .trailing))
//                .frame(width: 300, height: 300)
            
            Image("Health")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(
                    Triangle()
                        .rotation(Angle.degrees(180))
                )
        }
    }
}

#Preview {
    CustomShapesBootcamp()
}
