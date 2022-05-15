//
//  RecipeViewModel.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 15/05/2022.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var ratingSelected: Bool = false
    @Published var rating: Int = 0
}
