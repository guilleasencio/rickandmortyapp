// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension API {
  class GetCharactersQuery: GraphQLQuery {
    static let operationName: String = "GetCharacters"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
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

    struct Data: API.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("characters", Characters?.self, arguments: [
          "page": .variable("page"),
          "filter": ["gender": .variable("gender")]
        ]),
      ] }

      /// Get the list of all characters
      var characters: Characters? { __data["characters"] }

      /// Characters
      ///
      /// Parent Type: `Characters`
      struct Characters: API.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { API.Objects.Characters }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
        ] }

        var results: [Result?]? { __data["results"] }

        /// Characters.Result
        ///
        /// Parent Type: `Character`
        struct Result: API.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { API.Objects.Character }
          static var __selections: [ApolloAPI.Selection] { [
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
          var id: API.ID? { __data["id"] }
          /// The name of the character.
          var name: String? { __data["name"] }
          /// The status of the character ('Alive', 'Dead' or 'unknown').
          var status: String? { __data["status"] }
          /// The species of the character.
          var species: String? { __data["species"] }
          /// The type or subspecies of the character.
          var type: String? { __data["type"] }
          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          var gender: String? { __data["gender"] }
          /// The character's origin location
          var origin: Origin? { __data["origin"] }
          /// The character's last known location
          var location: Location? { __data["location"] }
          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          var image: String? { __data["image"] }
          /// Time at which the character was created in the database.
          var created: String? { __data["created"] }

          /// Characters.Result.Origin
          ///
          /// Parent Type: `Location`
          struct Origin: API.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            /// The name of the location.
            var name: String? { __data["name"] }
          }

          /// Characters.Result.Location
          ///
          /// Parent Type: `Location`
          struct Location: API.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            /// The name of the location.
            var name: String? { __data["name"] }
          }
        }
      }
    }
  }

}