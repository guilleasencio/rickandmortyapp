// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol API_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public protocol API_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public extension API {
  typealias SelectionSet = API_SelectionSet

  typealias InlineFragment = API_InlineFragment

  typealias MutableSelectionSet = API_MutableSelectionSet

  typealias MutableInlineFragment = API_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return API.Objects.Query
      case "Characters": return API.Objects.Characters
      case "Character": return API.Objects.Character
      case "Location": return API.Objects.Location
      case "Episode": return API.Objects.Episode
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}