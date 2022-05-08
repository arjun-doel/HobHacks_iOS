//
//  HeaderComponent.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI
import Awesome

struct HeaderComponent: View {
    @State private var date: String = ""
    @Binding var hasScrolled: Bool

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
                            .font(.largeTitle)
                        Awesome.Solid.hamburger.image
                            .foregroundColor(.brown)
                            .font(.title)
                    } else {
                        Awesome.Solid.hamburger.image
                            .foregroundColor(.brown)
                            .font(.title)
                    }
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
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent(hasScrolled: .constant(false))
    }
}
