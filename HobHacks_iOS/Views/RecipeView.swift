//
//  RecipeView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 09/05/2022.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading) {
                    hero
                    subsection
                    
                    VStack {
                        Text("Ingredients")
                            .font(.title3)
                        
                        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                            Text("Olive Oil")
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var hero: some View {
        ZStack {
            Image("salad")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Text("Greek Salad")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            .frame(width: 240, height: 60)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .offset(x: -100, y: -100)
            
            Image(systemName: "heart")
                .foregroundColor(.pink)
                .font(.system(size: 35))
                .frame(width: 55, height: 55)
                .background(.white)
                .mask(Circle())
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                .offset(x: 169, y: 180)
        }
    }
    
    var subsection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 0) {
                Image(systemName: "mappin")
                    .foregroundColor(.red)
                Text("Greece")
                    .font(.title3)
                .fontWeight(.medium)
            }
            
            HStack(spacing: 4) {
                Image(systemName: "clock")
                Text("20 mins")
                    .fontWeight(.light)
            }
            .font(.footnote)
            .offset(x: 3, y: 0)
            
        }
        .padding()
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
