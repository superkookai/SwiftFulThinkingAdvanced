//
//  ButtonStyleBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 23/11/2566 BE.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            Text("Click Me!")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
        })
//        .buttonStyle(.plain)
//        .buttonStyle(PressableButtonStyle())
        .withPressableStyle(scaleAmount: 0.8)
        .padding(40)
        
    }
}

extension View{
    func withPressableStyle(scaleAmount: CGFloat = 0.9) -> some View{
        self
            .buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}

struct PressableButtonStyle: ButtonStyle{
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat = 0.9){
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .brightness(configuration.isPressed ? 0.05 : 0.0)
//            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
