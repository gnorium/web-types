import EmbeddedSwiftUtilities


extension CSS {
  /// The rounding strategy of CSS `round()` (CSS Values and Units 4, §10.3).
  public enum RoundingStrategy: Sendable {
    case nearest
    case up
    case down
    case toZero

    public var keyword: String {
      switch self {
      case .nearest: return "nearest"
      case .up: return "up"
      case .down: return "down"
      case .toZero: return "to-zero"
      }
    }
  }
}

/// CSS `round(strategy, value, interval)`: `value` rounded to a whole
/// multiple of `interval`.
public func round(_ strategy: CSS.RoundingStrategy, _ value: CSS.LengthPercentage, _ interval: CSS.Length)
  -> CSS.LengthPercentage
{
  CSS.LengthPercentage("round(\(strategy.keyword), \(value.value), \(interval.value))")
}

public func round(_ strategy: CSS.RoundingStrategy, _ value: CSS.Percentage, _ interval: CSS.Length)
  -> CSS.LengthPercentage
{
  CSS.LengthPercentage("round(\(strategy.keyword), \(value.value), \(interval.value))")
}
