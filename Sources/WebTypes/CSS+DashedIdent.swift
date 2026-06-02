import EmbeddedSwiftUtilities

extension CSS {
  // <dashed-ident> = CSSContent custom property identifier starting with --
  public struct DashedIdent: Sendable {
    public let value: String

    public init(_ value: String) {
      // Ensure it starts with --
      if stringStartsWith(value, "--") {
        self.value = value
      } else {
        self.value = "--\(value)"
      }
    }
  }
}
