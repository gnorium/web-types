import EmbeddedSwiftUtilities

public struct Percentage: CustomStringConvertible, Sendable, CSSVariableConvertible {
  public let value: String

  public static func variable(_ name: String) -> Percentage {
    Percentage("var(\(name))")
  }

  internal init(_ value: String) {
    self.value = value
  }

  public init(_ value: Double) {
    #if SERVER
      self.value = "\(doubleToString(value))%"
    #endif
    #if CLIENT
      self.value = "\(doubleToString(value))%"
    #endif
  }

  public init(_ value: Int) {
    #if SERVER
      self.value = "\(value)%"
    #endif
    #if CLIENT
      self.value = "\(intToString(value))%"
    #endif
  }

  public var description: String {
    value
  }
}

public func perc(_ value: Double) -> Percentage {
  Percentage(value)
}

public func perc(_ value: Int) -> Percentage {
  Percentage(value)
}
