//
//  HeaderComponent.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI
//import Awesome

struct HeaderComponent: View {
    @State private var date: String = ""
    @Binding var hasScrolled: Bool
    @State private var showFavourites: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThickMaterial)
                .blur(radius: 30)
                .opacity(hasScrolled ? 1 : 0)
            VStack(alignment: .leading) {
                
                Text(date.uppercased())
                    .font(.caption)
                HStack {
                    if !hasScrolled {
                        Text("Featured Today")
                            .font(.system(size: 25)).bold()
//                        Awesome.Solid.hamburger.image
//                            .foregroundColor(.brown)
//                            .font(.title)
                    } else {
                        Image(systemName: "sun.min")
//                        Awesome.Solid.hamburger.image
//                            .foregroundColor(.brown)
//                            .font(.title)
                    }
                    
                    Spacer()
                    favouritesToolBar
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .onAppear {
                date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
            }
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var favouritesToolBar: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(.pink)
            .font(.title3)
            .frame(width: 35, height: 35)
            .background(.white)
            .mask(Circle())
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
            .offset(x: 0, y: hasScrolled ? -20 : -3)
            .scaleEffect(showFavourites ? 1.2 : 1)
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0)) {
                    showFavourites.toggle()
                }
            }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent(hasScrolled: .constant(false))
    }
}
