//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 28/11/2566 BE.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    let title: String = "New Title here!!"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView{
            VStack{
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75)
                    .onScrollViewOffsetChanged { offset in
                        scrollViewOffset = offset
                    }
                
                contentLayer
            }
            .padding()
        }
        .overlay(content: {
            Text("\(scrollViewOffset)")
        })
        .overlay(alignment: .top) {
            navBarLayer
                .opacity(scrollViewOffset < 45 ? 1.0 : 0.0)
        }
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp{
    private var titleLayer: some View{
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View{
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View{
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View{
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View{
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                action(value)
            })
    }
}

#Preview {
    ScrollViewOffsetPreferenceKeyBootcamp()
}
