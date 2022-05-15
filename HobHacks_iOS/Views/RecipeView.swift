//
//  RecipeView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 09/05/2022.
//

import SwiftUI
import zlib

struct RecipeView: View {
    @State private var rating: Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var showBackButton: Bool = true
    @State private var ratingSelected: Bool = false
    var recipe: Recipe
    
    let maxRating: Int = 5
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading) {
                    hero
                    subsection
                    ingredients
                    Spacer()
                    method
                    Spacer()
                    ratingModule
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var hero: some View {
        ZStack {
            AsyncImage(url: URL(string: recipe.recipeImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            VStack {
                Text(recipe.recipeName)
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .frame(width: 240, height: 60)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .offset(x: -100, y: -100)
            
            if showBackButton {
                backButton
            }
            
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
                Text(recipe.origin)
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
    
    var ingredients: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title3)
            
            ForEach(recipe.recipeIngredients, id: \.self) { item in
                VStack {
                    Text(item ?? "")
                        .font(.system(size: 17))
                        .padding()
                }
                .frame(width: 300, height: 50, alignment: .leading)
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                .padding(.vertical, 2)
            }
        }
        .padding()
    }
    
    var method: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Method")
                .padding()
                .font(.title3)
            VStack(alignment: .leading) {
                Text(recipe.recipeMethodLong)
                .frame(alignment: .leading)
            }
            .padding(.horizontal, 20)
        }
    }
    
    var ratingModule: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Rate Recipe")
                .fontWeight(.light)
            HStack {
                ForEach(0..<maxRating, id: \.self) { number in
                    Image(systemName: number < rating ? "star.fill" : "star")
                        .foregroundColor(.pink)
                        .font(.title3)
                        .scaleEffect(ratingSelected ? 1.2 : 1)
                        .onTapGesture {
                            withAnimation {
                                rating = number + 1
                                ratingSelected.toggle()
                            }
                            print("Rating>", rating)
                        }
                }
            }
        }
        .padding()
    }
    
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .frame(width: 68, height: 30)
            .background(.regularMaterial)
            .mask(RoundedRectangle(cornerRadius: 4, style: .continuous))
        }
        .tint(.pink)
        .offset(x: -180, y: -160)
    }
}

//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView()
//    }
//}
