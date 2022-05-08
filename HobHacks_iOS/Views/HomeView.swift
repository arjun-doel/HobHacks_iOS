//
//  HomeView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI
import Awesome

struct HomeView: View {
    @State private var hasScrolled: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                scrollDetection
                VStack(alignment: .leading, spacing: 0) {
                    cardList
                }
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 50)
            })
            .overlay(
                HeaderComponent(hasScrolled: $hasScrolled)
            )
        }
    }
    
    var cardList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                ForEach(0..<5) { item in
                    GeometryReader { geo in
                        let minX = geo.frame(in: .global).minX
                        CardComponent()
                            .frame(width: 330, height: 400)
                            .rotation3DEffect(.degrees(minX / -20), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 300, height: 400)
                    .padding()
                }
            }
            .padding(.vertical, 20)
            .edgesIgnoringSafeArea(.all)
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
    }
}
