#if CLIENT
  import EmbeddedSwiftUtilities
#endif

// <view-timeline-inset> = [ [ auto | <length-percentage> ]{1,2} ]#
extension CSS {
  public enum ViewTimelineInset: Sendable {
    case auto(CSS.Keyword.Auto)
    case lengthPercentage(CSS.Length)
    case pair(CSS.Length, CSS.Length)
    case autoPair(CSS.Keyword.Auto, CSS.Keyword.Auto)
    case mixedPair(CSS.Keyword.Auto, CSS.Length)
    case mixedPair2(CSS.Length, CSS.Keyword.Auto)

    public var value: String {
      switch self {
      case .auto(let keyword):
        return keyword.rawValue
      case .lengthPercentage(let lp):
        return lp.value
      case .pair(let lp1, let lp2):
        return "\(lp1.value) \(lp2.value)"
      case .autoPair(let a1, let a2):
        return "\(a1.rawValue) \(a2.rawValue)"
      case .mixedPair(let auto, let lp):
        return "\(auto.rawValue) \(lp.value)"
      case .mixedPair2(let lp, let auto):
        return "\(lp.value) \(auto.rawValue)"
      }
    }
  }
}
