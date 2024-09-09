// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQL

public class Location: MockObject {
  public static let objectType: ApolloAPI.Object = API.Objects.Location
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Location>>

  public struct MockFields {
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Location {
  convenience init(
    name: String? = nil
  ) {
    self.init()
    _setScalar(name, for: \.name)
  }
}
