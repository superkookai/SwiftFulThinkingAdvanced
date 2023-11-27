//
//  GenericsBootcamp.swift
//  SwiftFulThinkingAdvanced
//
//  Created by Weerawut Chaiyasomboon on 27/11/2566 BE.
//

import SwiftUI

struct StringModel{
    var info: String?
    
    func removeInfo() -> StringModel{
        return StringModel(info: nil)
    }
}

struct GenericModel<CustomType>{
    var info: CustomType?
    func removeInfo() -> GenericModel{
        return GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject{
    @Published var stringModel = StringModel(info: "Hello World!")
    
    @Published var genericStringModel = GenericModel(info: "Hello Generic String")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData(){
        stringModel = stringModel.removeInfo()
        
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T:View>: View {
    let title: String
    let content: T
    
    var body: some View {
        VStack{
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View {
        VStack{
            Text(viewModel.genericStringModel.info ?? "No data")
            Text(viewModel.genericBoolModel.info?.description ?? "No data")
            
            GenericView(title: "GenericView Title", content: Text("This is view"))
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

#Preview {
    GenericsBootcamp()
}
