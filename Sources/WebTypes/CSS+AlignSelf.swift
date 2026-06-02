extension CSS {
  public enum AlignSelf: String, Sendable {
    case normal = "normal"
    case stretch = "stretch"
    case center = "center"
    case start = "start"
    case end = "end"
    case flexStart = "flex-start"
    case flexEnd = "flex-end"
    case selfStart = "self-start"
    case selfEnd = "self-end"
    case baseline = "baseline"
    case firstBaseline = "first baseline"
    case lastBaseline = "last baseline"

    public static var auto: CSS.Keyword.Auto { .auto }
  }
}
