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
      url: URL(string: "https://graphql.contentful.com/content/v1/spaces/p2rxwlhttl99?access_token=KEIrFy-2iHbv1ZPjOPt5SWFYupnBdQ1VR6reOjgCOPo")!
    )
}
