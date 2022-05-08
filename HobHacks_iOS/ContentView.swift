//
//  ContentView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
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
                        Text("Maghreb")
                            .font(.subheadline)
                    }
                    .padding()
                    
                }
                .frame(width: 300, height: 400)
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                .frame(width: 400)
                .overlay(
                    Image(systemName: "heart.fill")
                        .foregroundColor(.purple)
                        .font(.title)
                        .offset(x: 110, y: 135)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
