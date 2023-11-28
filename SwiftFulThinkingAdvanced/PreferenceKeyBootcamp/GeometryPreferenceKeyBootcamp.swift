//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 28/11/2566 BE.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Hello World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            Spacer()
            
            HStack{
                Rectangle()
                GeometryReader(content: { geometry in
                    Rectangle()
                        .updateRectangleGeoSize(geometry.size)
                })
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self, perform: { value in
            rectSize = value
        })
        
    }
}

extension View{
    func updateRectangleGeoSize(_ size: CGSize) -> some View{
        self
            .preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey{
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    GeometryPreferenceKeyBootcamp()
}


