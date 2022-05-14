//
//  PopularCard.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 09/05/2022.
//

import SwiftUI

struct PopularCard: View {
    @State private var showDetails: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("salad")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
            
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(alignment: .center) {
                Text("Greek Salad")
                    .font(.body)
                    .fontWeight(.light)
                    Text("Greece")
                        .font(.caption)
                        .fontWeight(.thin)
                Spacer()
            }
            .padding()
        }
        .frame(width: 160, height: 200)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 3)
        .padding()
        .onTapGesture {
            showDetails = true
        }
        .sheet(isPresented: $showDetails) {
            RecipeView(showBackButton: false)
        }
    }
}

struct PopularCard_Previews: PreviewProvider {
    static var previews: some View {
        PopularCard()
    }
}
