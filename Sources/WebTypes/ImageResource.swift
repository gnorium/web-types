public struct ImageResource: Sendable {
  public let src: String
  public let sizes: String?
  public let type: String?
  public let purpose: String?

  public init(src: String, sizes: String? = nil, type: String? = nil, purpose: String? = nil) {
    self.src = src
    self.sizes = sizes
    self.type = type
    self.purpose = purpose
  }
}
