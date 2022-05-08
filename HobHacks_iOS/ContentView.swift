//
//  ContentView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "house")
                }
                
                NavigationView {
                    SearchView()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                
                NavigationView {
                    AccountView()
                }
                .tabItem {
                    Image(systemName: "person")
                }
            }
            .accentColor(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
