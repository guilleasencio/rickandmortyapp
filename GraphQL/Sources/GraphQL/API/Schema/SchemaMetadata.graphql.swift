// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol API_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

protocol API_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

protocol API_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

protocol API_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

extension API {
  typealias SelectionSet = API_SelectionSet

  typealias InlineFragment = API_InlineFragment

  typealias MutableSelectionSet = API_MutableSelectionSet

  typealias MutableInlineFragment = API_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return API.Objects.Query
      case "Characters": return API.Objects.Characters
      case "Character": return API.Objects.Character
      case "Location": return API.Objects.Location
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}