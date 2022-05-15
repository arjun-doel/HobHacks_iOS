// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class RecipeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Recipe {
      recipeCollection {
        __typename
        recipes: items {
          __typename
          sys {
            __typename
            id
            publishedAt
          }
          recipeName
          recipeType
          recipeMethodLong
          origin
          recipeImage {
            __typename
            url
          }
          recipeVideo
          recipeRating
          recipeSource
          recipeCategories
          recipeIngredients
        }
      }
    }
    """

  public let operationName: String = "Recipe"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recipeCollection", type: .object(RecipeCollection.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recipeCollection: RecipeCollection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "recipeCollection": recipeCollection.flatMap { (value: RecipeCollection) -> ResultMap in value.resultMap }])
    }

    public var recipeCollection: RecipeCollection? {
      get {
        return (resultMap["recipeCollection"] as? ResultMap).flatMap { RecipeCollection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "recipeCollection")
      }
    }

    public struct RecipeCollection: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RecipeCollection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", alias: "recipes", type: .nonNull(.list(.object(Recipe.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(recipes: [Recipe?]) {
        self.init(unsafeResultMap: ["__typename": "RecipeCollection", "recipes": recipes.map { (value: Recipe?) -> ResultMap? in value.flatMap { (value: Recipe) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var recipes: [Recipe?] {
        get {
          return (resultMap["recipes"] as! [ResultMap?]).map { (value: ResultMap?) -> Recipe? in value.flatMap { (value: ResultMap) -> Recipe in Recipe(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Recipe?) -> ResultMap? in value.flatMap { (value: Recipe) -> ResultMap in value.resultMap } }, forKey: "recipes")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Recipe"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("sys", type: .nonNull(.object(Sy.selections))),
            GraphQLField("recipeName", type: .scalar(String.self)),
            GraphQLField("recipeType", type: .scalar(String.self)),
            GraphQLField("recipeMethodLong", type: .scalar(String.self)),
            GraphQLField("origin", type: .scalar(String.self)),
            GraphQLField("recipeImage", type: .object(RecipeImage.selections)),
            GraphQLField("recipeVideo", type: .scalar(String.self)),
            GraphQLField("recipeRating", type: .scalar(Int.self)),
            GraphQLField("recipeSource", type: .scalar(String.self)),
            GraphQLField("recipeCategories", type: .list(.scalar(String.self))),
            GraphQLField("recipeIngredients", type: .list(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(sys: Sy, recipeName: String? = nil, recipeType: String? = nil, recipeMethodLong: String? = nil, origin: String? = nil, recipeImage: RecipeImage? = nil, recipeVideo: String? = nil, recipeRating: Int? = nil, recipeSource: String? = nil, recipeCategories: [String?]? = nil, recipeIngredients: [String?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Recipe", "sys": sys.resultMap, "recipeName": recipeName, "recipeType": recipeType, "recipeMethodLong": recipeMethodLong, "origin": origin, "recipeImage": recipeImage.flatMap { (value: RecipeImage) -> ResultMap in value.resultMap }, "recipeVideo": recipeVideo, "recipeRating": recipeRating, "recipeSource": recipeSource, "recipeCategories": recipeCategories, "recipeIngredients": recipeIngredients])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var sys: Sy {
          get {
            return Sy(unsafeResultMap: resultMap["sys"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "sys")
          }
        }

        public var recipeName: String? {
          get {
            return resultMap["recipeName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeName")
          }
        }

        public var recipeType: String? {
          get {
            return resultMap["recipeType"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeType")
          }
        }

        public var recipeMethodLong: String? {
          get {
            return resultMap["recipeMethodLong"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeMethodLong")
          }
        }

        public var origin: String? {
          get {
            return resultMap["origin"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "origin")
          }
        }

        public var recipeImage: RecipeImage? {
          get {
            return (resultMap["recipeImage"] as? ResultMap).flatMap { RecipeImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "recipeImage")
          }
        }

        public var recipeVideo: String? {
          get {
            return resultMap["recipeVideo"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeVideo")
          }
        }

        public var recipeRating: Int? {
          get {
            return resultMap["recipeRating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeRating")
          }
        }

        public var recipeSource: String? {
          get {
            return resultMap["recipeSource"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeSource")
          }
        }

        public var recipeCategories: [String?]? {
          get {
            return resultMap["recipeCategories"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeCategories")
          }
        }

        public var recipeIngredients: [String?]? {
          get {
            return resultMap["recipeIngredients"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "recipeIngredients")
          }
        }

        public struct Sy: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sys"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("publishedAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, publishedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sys", "id": id, "publishedAt": publishedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var publishedAt: String? {
            get {
              return resultMap["publishedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "publishedAt")
            }
          }
        }

        public struct RecipeImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Asset"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Asset", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}
