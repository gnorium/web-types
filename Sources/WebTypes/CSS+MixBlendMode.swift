extension CSS {
  public enum MixBlendMode: String {
    case plusDarker = "plus-darker"
    case plusLighter = "plus-lighter"

    /// Initialize from CSSBlendMode
    public init(_ blendMode: CSS.BlendMode) {
      self.init(rawValue: blendMode.value)!
    }
  }
}
