import EmbeddedSwiftUtilities

// <angle> = <number><angle-unit>
// <angle-unit> = deg | grad | rad | turn

extension CSS {
  public struct Angle: Sendable, CSSVariableConvertible {
    public let value: String

    public static func variable(_ name: String) -> CSS.Angle {
      CSS.Angle("var(\(name))")
    }

    private init(_ value: String) {
      self.value = value
    }

    // Degrees
    public static func deg(_ value: Double) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(doubleToString(value))deg")
      #endif
      #if CLIENT
        return CSS.Angle("\(doubleToString(value))deg")
      #endif
    }

    public static func deg(_ value: Int) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(value)deg")
      #endif
      #if CLIENT
        return CSS.Angle("\(intToString(value))deg")
      #endif
    }

    // Gradians
    public static func grad(_ value: Double) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(doubleToString(value))grad")
      #endif
      #if CLIENT
        return CSS.Angle("\(doubleToString(value))grad")
      #endif
    }

    public static func grad(_ value: Int) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(value)grad")
      #endif
      #if CLIENT
        return CSS.Angle("\(intToString(value))grad")
      #endif
    }

    // Radians
    public static func rad(_ value: Double) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(doubleToString(value))rad")
      #endif
      #if CLIENT
        return CSS.Angle("\(doubleToString(value))rad")
      #endif
    }

    public static func rad(_ value: Int) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(value)rad")
      #endif
      #if CLIENT
        return CSS.Angle("\(intToString(value))rad")
      #endif
    }

    // Turns
    public static func turn(_ value: Double) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(doubleToString(value))turn")
      #endif
      #if CLIENT
        return CSS.Angle("\(doubleToString(value))turn")
      #endif
    }

    public static func turn(_ value: Int) -> CSS.Angle {
      #if SERVER
        return CSS.Angle("\(value)turn")
      #endif
      #if CLIENT
        return CSS.Angle("\(intToString(value))turn")
      #endif
    }
  }
}

// Convenience global functions
public func deg(_ value: Double) -> CSS.Angle {
  .deg(value)
}

public func deg(_ value: Int) -> CSS.Angle {
  .deg(value)
}

public func grad(_ value: Double) -> CSS.Angle {
  .grad(value)
}

public func grad(_ value: Int) -> CSS.Angle {
  .grad(value)
}

public func rad(_ value: Double) -> CSS.Angle {
  .rad(value)
}

public func rad(_ value: Int) -> CSS.Angle {
  .rad(value)
}

public func turn(_ value: Double) -> CSS.Angle {
  .turn(value)
}

public func turn(_ value: Int) -> CSS.Angle {
  .turn(value)
}
