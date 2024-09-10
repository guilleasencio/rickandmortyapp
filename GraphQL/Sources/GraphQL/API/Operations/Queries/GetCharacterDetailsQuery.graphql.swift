// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class GetCharacterDetailsQuery: GraphQLQuery {
    public static let operationName: String = "GetCharacterDetails"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetCharacterDetails($id: ID!) { character(id: $id) { __typename id name status species type gender origin { __typename id name type dimension residents { __typename id name } created } location { __typename id name type dimension residents { __typename id name } created } image episode { __typename id name air_date episode characters { __typename id name } created } created } }"#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("character", Character?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Get a specific character by ID
      public var character: Character? { __data["character"] }

      /// Character
      ///
      /// Parent Type: `Character`
      public struct Character: API.SelectionSet {
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
          .field("episode", [Episode?]?.self),
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
        /// Episodes in which this character appeared.
        public var episode: [Episode?]? { __data["episode"] }
        /// Time at which the character was created in the database.
        public var created: String? { __data["created"] }

        /// Character.Origin
        ///
        /// Parent Type: `Location`
        public struct Origin: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID?.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("dimension", String?.self),
            .field("residents", [Resident?]?.self),
            .field("created", String?.self),
          ] }

          /// The id of the location.
          public var id: API.ID? { __data["id"] }
          /// The name of the location.
          public var name: String? { __data["name"] }
          /// The type of the location.
          public var type: String? { __data["type"] }
          /// The dimension in which the location is located.
          public var dimension: String? { __data["dimension"] }
          /// List of characters who have been last seen in the location.
          public var residents: [Resident?]? { __data["residents"] }
          /// Time at which the location was created in the database.
          public var created: String? { __data["created"] }

          /// Character.Origin.Resident
          ///
          /// Parent Type: `Character`
          public struct Resident: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { API.Objects.Character }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", API.ID?.self),
              .field("name", String?.self),
            ] }

            /// The id of the character.
            public var id: API.ID? { __data["id"] }
            /// The name of the character.
            public var name: String? { __data["name"] }
          }
        }

        /// Character.Location
        ///
        /// Parent Type: `Location`
        public struct Location: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { API.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID?.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("dimension", String?.self),
            .field("residents", [Resident?]?.self),
            .field("created", String?.self),
          ] }

          /// The id of the location.
          public var id: API.ID? { __data["id"] }
          /// The name of the location.
          public var name: String? { __data["name"] }
          /// The type of the location.
          public var type: String? { __data["type"] }
          /// The dimension in which the location is located.
          public var dimension: String? { __data["dimension"] }
          /// List of characters who have been last seen in the location.
          public var residents: [Resident?]? { __data["residents"] }
          /// Time at which the location was created in the database.
          public var created: String? { __data["created"] }

          /// Character.Location.Resident
          ///
          /// Parent Type: `Character`
          public struct Resident: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { API.Objects.Character }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", API.ID?.self),
              .field("name", String?.self),
            ] }

            /// The id of the character.
            public var id: API.ID? { __data["id"] }
            /// The name of the character.
            public var name: String? { __data["name"] }
          }
        }

        /// Character.Episode
        ///
        /// Parent Type: `Episode`
        public struct Episode: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { API.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID?.self),
            .field("name", String?.self),
            .field("air_date", String?.self),
            .field("episode", String?.self),
            .field("characters", [Character?]?.self),
            .field("created", String?.self),
          ] }

          /// The id of the episode.
          public var id: API.ID? { __data["id"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
          /// The air date of the episode.
          public var air_date: String? { __data["air_date"] }
          /// The code of the episode.
          public var episode: String? { __data["episode"] }
          /// List of characters who have been seen in the episode.
          public var characters: [Character?]? { __data["characters"] }
          /// Time at which the episode was created in the database.
          public var created: String? { __data["created"] }

          /// Character.Episode.Character
          ///
          /// Parent Type: `Character`
          public struct Character: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { API.Objects.Character }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", API.ID?.self),
              .field("name", String?.self),
            ] }

            /// The id of the character.
            public var id: API.ID? { __data["id"] }
            /// The name of the character.
            public var name: String? { __data["name"] }
          }
        }
      }
    }
  }

}