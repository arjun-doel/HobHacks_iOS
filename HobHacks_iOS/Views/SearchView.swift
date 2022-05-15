//
//  SearchView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var homeVm: HomeViewModel
    @StateObject var searchVM = SearchViewModel()
    @State private var value: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                VStack {
                    searchField
                    List(searchResults) { recipe in
                        NavigationLink(destination: {
                            RecipeView(showBackButton: true, recipe: recipe)
                                .navigationBarHidden(true)
                        }, label: {
                            ListRow(recipe: recipe)
                        })
                    }
                    .searchable(text: $searchVM.value)
                }
                .navigationBarHidden(true)
            }
        }
        
    }
    
    var searchResults: [Recipe] {
            if searchVM.value.isEmpty {
                return homeVm.recipes
            } else {
                return homeVm.recipes.filter { $0.recipeName.contains(searchVM.value) }
            }
        }
    
    var searchField: some View {
        VStack {
            TextField("Search", text: $searchVM.value, prompt: Text("Search meal..."))
                .padding()
        }
        .frame(width: 400, height: 50, alignment: .leading)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
