public enum CSSFontVariantNumeric: String, Sendable {
  case normal = "normal"
  case tabularNums = "tabular-nums"
  case oldstyleNums = "oldstyle-nums"
  case liningNums = "lining-nums"
  case proportionalNums = "proportional-nums"
  case diagonalFractions = "diagonal-fractions"
  case stackedFractions = "stacked-fractions"

  public var staticRawValue: StaticString {
    switch self {
    case .normal: return "normal"
    case .tabularNums: return "tabular-nums"
    case .oldstyleNums: return "oldstyle-nums"
    case .liningNums: return "lining-nums"
    case .proportionalNums: return "proportional-nums"
    case .diagonalFractions: return "diagonal-fractions"
    case .stackedFractions: return "stacked-fractions"
    }
  }
}
