import EmbeddedSwiftUtilities

extension CSS {
  public struct Length: Sendable, CustomStringConvertible, CSSVariableConvertible,
    ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral
  {
    public let value: String

    public init(integerLiteral value: Int) {
      #if SERVER
        self.value = "\(value)"
      #endif
      #if CLIENT
        self.value = intToString(value)
      #endif
    }

    public init(floatLiteral value: Double) {
      #if SERVER
        self.value = doubleToString(value)
      #endif
      #if CLIENT
        self.value = doubleToString(value)
      #endif
    }

    internal init(_ value: String) {
      self.value = value
    }

    public static func variable(_ name: String) -> Length {
      Length("var(\(name))")
    }

    public static var auto: CSS.Keyword.Auto { .auto }

    public var description: String {
      value
    }
  }

}

public func px(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)px")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))px")
  #endif
}

public func px(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))px")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))px")
  #endif
}

public func em(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)em")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))em")
  #endif
}

public func em(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))em")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))em")
  #endif
}

public func rem(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)rem")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))rem")
  #endif
}

public func pt(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)pt")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))pt")
  #endif
}

public func pt(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))pt")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))pt")
  #endif
}

public func rem(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))rem")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))rem")
  #endif
}

public func vw(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)vw")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))vw")
  #endif
}

public func vw(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))vw")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))vw")
  #endif
}

public func vh(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)vh")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))vh")
  #endif
}

public func vh(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))vh")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))vh")
  #endif
}

public func dvh(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)dvh")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))dvh")
  #endif
}

public func dvh(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))dvh")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))dvh")
  #endif
}

public func fr(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)fr")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))fr")
  #endif
}

public func fr(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))fr")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))fr")
  #endif
}

public func ch(_ int: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(int)ch")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(int))ch")
  #endif
}

public func ch(_ double: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(double))ch")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(double))ch")
  #endif
}

public func minmax(_ min: CSS.Length, _ max: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("minmax(\(min.value), \(max.value))")
  #endif
  #if CLIENT
    return CSS.Length("minmax(\(min.value), \(max.value))")
  #endif
}

public func `repeat`(_ count: CSS.GridRepeat, _ value: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("repeat(\(count.rawValue), \(value.value))")
  #endif
  #if CLIENT
    return CSS.Length("repeat(\(count.rawValue), \(value.value))")
  #endif
}

public func `repeat`(_ count: Int, _ value: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("repeat(\(count), \(value.value))")
  #endif
  #if CLIENT
    return CSS.Length("repeat(\(intToString(count)), \(value.value))")
  #endif
}

// Arithmetic operators for Length
public func + (lhs: CSS.Length, rhs: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) + \(rhs.value)")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) + \(rhs.value)")
  #endif
}

public func - (lhs: CSS.Length, rhs: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) - \(rhs.value)")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) - \(rhs.value)")
  #endif
}

// Unary negation operator
public prefix func - (value: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("-\(value.value)")
  #endif
  #if CLIENT
    return CSS.Length("-\(value.value)")
  #endif
}

@_disfavoredOverload
public func * (lhs: CSS.Length, rhs: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) * \(rhs)")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) * \(intToString(rhs))")
  #endif
}

@_disfavoredOverload
public func * (lhs: Int, rhs: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs) * \(rhs.value)")
  #endif
  #if CLIENT
    return CSS.Length("\(intToString(lhs)) * \(rhs.value)")
  #endif
}

@_disfavoredOverload
public func * (lhs: CSS.Length, rhs: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) * \(doubleToString(rhs))")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) * \(doubleToString(rhs))")
  #endif
}

@_disfavoredOverload
public func * (lhs: Double, rhs: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(doubleToString(lhs)) * \(rhs.value)")
  #endif
  #if CLIENT
    return CSS.Length("\(doubleToString(lhs)) * \(rhs.value)")
  #endif
}

public func * (lhs: CSS.Percentage, rhs: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) * \(rhs)")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) * \(intToString(rhs))")
  #endif
}

public func / (lhs: CSS.Length, rhs: Int) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) / \(rhs)")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) / \(intToString(rhs))")
  #endif
}

public func / (lhs: CSS.Length, rhs: Double) -> CSS.Length {
  #if SERVER
    return CSS.Length("\(lhs.value) / \(doubleToString(rhs))")
  #endif
  #if CLIENT
    return CSS.Length("\(lhs.value) / \(doubleToString(rhs))")
  #endif
}

public func / (lhs: CSS.Length, rhs: CSS.Length) -> CSS.Length {
  #if SERVER
    return CSS.Length("(\(lhs.value)) / (\(rhs.value))")
  #endif
  #if CLIENT
    return CSS.Length("(\(lhs.value)) / (\(rhs.value))")
  #endif
}
