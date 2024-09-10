// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class GetCharactersQuery: GraphQLQuery {
    public static let operationName: String = "GetCharacters"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetCharacters($page: Int!, $gender: String!) { characters(page: $page, filter: { gender: $gender }) { __typename results { __typename id name status species type gender origin { __typename name } location { __typename name } image created } } }"#
      ))

    public var page: Int
    public var gender: String

    public init(
      page: Int,
      gender: String
    ) {
      self.page = page
      self.gender = gender
    }

    public var __variables: Variables? { [
      "page": page,
      "gender": gender
    ] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("characters", Characters?.self, arguments: [
          "page": .variable("page"),
          "filter": ["gender": .variable("gender")]
        ]),
      ] }

      /// Get the list of all characters
      public var characters: Characters? { __data["characters"] }

      /// Characters
      ///
      /// Parent Type: `Characters`
      public struct Characters: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { API.Objects.Characters }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
        ] }

        public var results: [Result?]? { __data["results"] }

        /// Characters.Result
        ///
        /// Parent Type: `Character`
        public struct Result: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { API.Objects.Character }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID?.self),
            .field("name", String?.self),
            .field("status", String?.self),
            .field("species", String?.self),
            .field("type", String?.self),
            .field("gender", String?.self),
            .field("origin", Origin?.self),
            .field("location", Location?.self),
            .field("image", String?.self),
            .field("created", String?.self),
          ] }

          /// The id of the character.
          public var id: API.ID? { __data["id"] }
          /// The name of the character.
          public var name: String? { __data["name"] }
          /// The status of the character ('Alive', 'Dead' or 'unknown').
          public var status: String? { __data["status"] }
          /// The species of the character.
          public var species: String? { __data["species"] }
          /// The type or subspecies of the character.
          public var type: String? { __data["type"] }
          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          public var gender: String? { __data["gender"] }
          /// The character's origin location
          public var origin: Origin? { __data["origin"] }
          /// The character's last known location
          public var location: Location? { __data["location"] }
          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? { __data["image"] }
          /// Time at which the character was created in the database.
          public var created: String? { __data["created"] }

          /// Characters.Result.Origin
          ///
          /// Parent Type: `Location`
          public struct Origin: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            /// The name of the location.
            public var name: String? { __data["name"] }
          }

          /// Characters.Result.Location
          ///
          /// Parent Type: `Location`
          public struct Location: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            /// The name of the location.
            public var name: String? { __data["name"] }
          }
        }
      }
    }
  }

}