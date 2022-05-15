//
//  HomeView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI
//import Awesome

struct HomeView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @State private var hasScrolled: Bool = false
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                scrollDetection
                VStack(alignment: .leading, spacing: 0) {
                    featuredSection
                    
                    popularSection
                }
                .refreshable {
                    print("Refreshing")
                }
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 50)
            })
            .overlay(
                HeaderComponent(hasScrolled: $hasScrolled)
            )
        }
        .task {
            await homeVM.fetch()
        }
    }
    
    var featuredSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                if homeVM.recipes.count > 0 {
                    ForEach(homeVM.recipes) { recipe in
                        GeometryReader { geo in
                            let minX = geo.frame(in: .global).minX
                            CardComponent(recipe: recipe)
                                .frame(width: 330, height: 400)
                                .rotation3DEffect(.degrees(minX / -20), axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(width: 280, height: 400)
                        .padding()
                    }
                } else {
                    ForEach(0..<5) { recipe in
                        GeometryReader { geo in
                            let minX = geo.frame(in: .global).minX
                            CardComponentRedacted()
                                .redacted(reason: .placeholder)
                                .frame(width: 330, height: 400)
                                .rotation3DEffect(.degrees(minX / -20), axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(width: 280, height: 400)
                        .padding()
                    }
                }
            }
            .padding(.vertical, 20)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    var popularSection: some View {
        VStack(alignment: .leading, spacing: -8) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Popular")
                    .font(.title3).bold()
            }
            .padding()
            
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(homeVM.recipes) { recipe in
                    PopularCard(recipe: recipe)
                }
            }
        }
    }
    
    // Track vertical scrolling and updates state hasScrolled to trigger animations.
    var scrollDetection: some View {
        GeometryReader { geo in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: geo.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation {
                if value < 100 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
