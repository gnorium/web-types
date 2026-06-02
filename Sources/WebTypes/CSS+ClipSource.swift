#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public enum ClipSource: Sendable {
    case url(String)

    public var value: String {
      switch self {
      case .url(let urlValue):
        return WebTypes.url("\(urlValue)")
      }
    }
  }
}
