//
//  ViewBuilderBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 28/11/2566 BE.
//

import SwiftUI

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: "Hello", iconName: "heart")
            
            HeaderViewGeneric(title: "Generic") {
                HStack{
                    Text("helloooooo")
                    Image(systemName: "bolt.fill")
                }
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hello")
                Text("Goodbye")
            }
            
            LocalViewBuilder(type: .three)
            LocalViewBuilder(type: .two)
            LocalViewBuilder(type: .one)
            
            Spacer()
        }
    }
}

#Preview {
    ViewBuilderBootcamp()
}

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description{
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName{
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content:View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack{
            self.content
        }
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType{
        case one,two,three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack{
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View{
        switch type{
        case .one: viewOne
        case .two: viewTwo
        case .three: viewThree
        }
    }
    
    private var viewOne: some View{
        Text("One")
    }
    
    private var viewTwo: some View{
        VStack{ Text("Two"); Image(systemName: "heart.fill")}
    }
    
    private var viewThree: some View{
        HStack { Text("Three"); Image(systemName: "bolt.fill")}
    }
}
