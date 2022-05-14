//
//  RecipeView.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 09/05/2022.
//

import SwiftUI

struct RecipeView: View {
    @State private var rating: Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var showBackButton: Bool = true
    @State private var ratingSelected: Bool = false
    
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
    
    var ingredients: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title3)
            
            ForEach(0 ..< 5) { item in
                VStack {
                    Text("Olive Oil - 10ml")
                        .padding()
                }
                .frame(width: 200, height: 50, alignment: .leading)
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
                Text("""
                     STEP 1 Place 4 large vine tomatoes, cut into wedges, 1 peeled, deseeded and chopped cucumber, ½ a thinly sliced red onion, 16 Kalamata olives, 1 tsp dried oregano, 85g feta cheese chunks and 4 tbsp Greek extra virgin olive oil in a large bowl.
                     
                     STEP 2 Lightly season, then serve with crusty bread to mop up all of the juices.
                     """)
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

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
