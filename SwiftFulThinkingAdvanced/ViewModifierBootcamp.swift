//
//  ViewModifierBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 23/11/2566 BE.
//

import SwiftUI

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .blue))
            
            Text("Hello, Everyone!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))
            
            Text("Hello, Kai!")
                .withDefaultButtonFormatting(backgroundColor: .orange)
        }
    }
}

extension View{
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View{
        self
            .modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct DefaultButtonViewModifier: ViewModifier{
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
