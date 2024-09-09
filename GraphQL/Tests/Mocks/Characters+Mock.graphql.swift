// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQL

public class Characters: MockObject {
  public static let objectType: ApolloAPI.Object = API.Objects.Characters
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Characters>>

  public struct MockFields {
    @Field<[Character?]>("results") public var results
  }
}

public extension Mock where O == Characters {
  convenience init(
    results: [Mock<Character>?]? = nil
  ) {
    self.init()
    _setList(results, for: \.results)
  }
}
