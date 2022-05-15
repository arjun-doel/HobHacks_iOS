//
//  SearchView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var value: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                VStack {
                    searchField
//                    List(0 ..< 5) { item in
//                        NavigationLink(destination: {
//                            RecipeView(showBackButton: true)
//                                .navigationBarHidden(true)
//                        }, label: {
//                            listRow
//                        })
//                    }
                }
                .navigationBarHidden(true)
            }
        }
        
    }
    
    var searchField: some View {
        VStack {
            TextField("Search", text: $value, prompt: Text("Search meal..."))
                .padding()
        }
        .frame(width: 400, height: 50, alignment: .leading)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
    
    var listRow: some View {
        HStack {
            Image("salad")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60, alignment: .leading)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(alignment: .leading, spacing: 5) {
                Text("Result")
                HStack(spacing: 0) {
                    Image(systemName: "mappin")
                        .font(.system(size: 15))
                    Text("Location")
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
