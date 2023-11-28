//
//  PreferenceKeyBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 28/11/2566 BE.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    @State private var text: String = "Hello World!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
            }
            .navigationTitle("Nav Title")
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View{
    
    func customTitle(_ text: String) -> some View{
        self
            .preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromDatabase)
            .customTitle(newValue)
    }
    
    func getDataFromDatabase(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.newValue = "New value from Database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
