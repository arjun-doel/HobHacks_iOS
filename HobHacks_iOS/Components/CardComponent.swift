//
//  CardComponent.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct CardComponent: View {
    @State private var isLiked: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("demoRecipe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 280, height: 280)
                .mask(RoundedRectangle(cornerRadius: 30, style: . continuous))
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Shakshouka")
                    .font(.title2).bold()
                    .foregroundColor(.black)
                HStack(spacing: 2) {
                    Image(systemName: "mappin")
                        .font(.subheadline)
                    Text("Maghreb")
                        .font(.subheadline)
                }
            }
            .padding()
            
        }
        .frame(width: 300, height: 400)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        .frame(width: 400)
        .overlay(
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .scaleEffect(isLiked ? 1.2 : 1)
                .foregroundColor(.pink)
                .font(.title)
                .offset(x: 110, y: 135)
                .onTapGesture {
                    withAnimation {
                        isLiked.toggle()
                    }
                }
        )
        .padding()
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent()
    }
}
