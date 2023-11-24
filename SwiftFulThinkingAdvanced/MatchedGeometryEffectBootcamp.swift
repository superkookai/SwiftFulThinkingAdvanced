//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 24/11/2566 BE.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack{
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectBootcamp()
}

struct MatchedGeometryEffectExample: View {
    let categories: [String] = ["Home","Popular","Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack{
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width: 35,height: 2)
                            .offset(y:20)
                    }
                    
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring){
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
