import EmbeddedSwiftUtilities

// <angle> = <number><angle-unit>
// <angle-unit> = deg | grad | rad | turn

public struct CSSAngle: Sendable, CSSVariableConvertible {
  public let value: String

  public static func variable(_ name: String) -> CSSAngle {
    CSSAngle("var(\(name))")
  }

  private init(_ value: String) {
    self.value = value
  }

  // Degrees
  public static func deg(_ value: Double) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(doubleToString(value))deg")
    #endif
    #if CLIENT
      return CSSAngle("\(doubleToString(value))deg")
    #endif
  }

  public static func deg(_ value: Int) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(value)deg")
    #endif
    #if CLIENT
      return CSSAngle("\(intToString(value))deg")
    #endif
  }

  // Gradians
  public static func grad(_ value: Double) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(doubleToString(value))grad")
    #endif
    #if CLIENT
      return CSSAngle("\(doubleToString(value))grad")
    #endif
  }

  public static func grad(_ value: Int) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(value)grad")
    #endif
    #if CLIENT
      return CSSAngle("\(intToString(value))grad")
    #endif
  }

  // Radians
  public static func rad(_ value: Double) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(doubleToString(value))rad")
    #endif
    #if CLIENT
      return CSSAngle("\(doubleToString(value))rad")
    #endif
  }

  public static func rad(_ value: Int) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(value)rad")
    #endif
    #if CLIENT
      return CSSAngle("\(intToString(value))rad")
    #endif
  }

  // Turns
  public static func turn(_ value: Double) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(doubleToString(value))turn")
    #endif
    #if CLIENT
      return CSSAngle("\(doubleToString(value))turn")
    #endif
  }

  public static func turn(_ value: Int) -> CSSAngle {
    #if SERVER
      return CSSAngle("\(value)turn")
    #endif
    #if CLIENT
      return CSSAngle("\(intToString(value))turn")
    #endif
  }
}

// Convenience global functions
public func deg(_ value: Double) -> CSSAngle {
  .deg(value)
}

public func deg(_ value: Int) -> CSSAngle {
  .deg(value)
}

public func grad(_ value: Double) -> CSSAngle {
  .grad(value)
}

public func grad(_ value: Int) -> CSSAngle {
  .grad(value)
}

public func rad(_ value: Double) -> CSSAngle {
  .rad(value)
}

public func rad(_ value: Int) -> CSSAngle {
  .rad(value)
}

public func turn(_ value: Double) -> CSSAngle {
  .turn(value)
}

public func turn(_ value: Int) -> CSSAngle {
  .turn(value)
}
