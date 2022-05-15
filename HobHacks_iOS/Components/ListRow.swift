//
//  ListRow.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 15/05/2022.
//

import SwiftUI

struct ListRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.recipeImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .leading)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            } placeholder: {
                ProgressView()
            }
//            Image("salad")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 60, height: 60, alignment: .leading)
//                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.recipeName)
                HStack(spacing: 0) {
                    Image(systemName: "mappin")
                        .font(.system(size: 15))
                    Text(recipe.origin)
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
        }
    }
}

//struct ListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRow()
//    }
//}
