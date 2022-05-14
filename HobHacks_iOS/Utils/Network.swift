//
//  Network.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 14/05/2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(
      url: URL(string: "https://graphql.contentful.com/content/v1/spaces/vaavv9zan5w6?access_token=pDSUxnnmUNuJu2GoL3rIF1nJAk3ALmu9D-ro7pjsJm4")!
    )
}
