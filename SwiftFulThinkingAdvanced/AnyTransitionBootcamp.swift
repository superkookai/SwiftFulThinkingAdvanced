//
//  AnyTransitionBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 24/11/2566 BE.
//

import SwiftUI

struct RotateViewModifier: ViewModifier{
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition{
    static var rotating: AnyTransition{
        return AnyTransition.modifier(
            active: RotateViewModifier(
                rotation: 180
            ),
            identity: RotateViewModifier(
                rotation: 0
            )
        )
    }
    
    static func rotating(rotation: Double) -> AnyTransition{
        return AnyTransition.modifier(
            active: RotateViewModifier(
                rotation: rotation
            ),
            identity: RotateViewModifier(
                rotation: 0
            )
        )
    }
    
    static var rotateOn: AnyTransition{
        return AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading)
        )
    }
}

struct AnyTransitionBootcamp: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 250, height: 350)
//                    .transition(.move(edge: .leading))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.rotating(rotation: 1080))
                    .transition(.rotateOn)
            }
           
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormatting(backgroundColor: .blue)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
