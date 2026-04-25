import EmbeddedSwiftUtilities

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

  public var description: String {
    value
  }
}

public func px(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)px")
  #endif
  #if CLIENT
    return Length("\(intToString(int))px")
  #endif
}

public func px(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))px")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))px")
  #endif
}

public func em(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)em")
  #endif
  #if CLIENT
    return Length("\(intToString(int))em")
  #endif
}

public func em(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))em")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))em")
  #endif
}

public func rem(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)rem")
  #endif
  #if CLIENT
    return Length("\(intToString(int))rem")
  #endif
}

public func pt(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)pt")
  #endif
  #if CLIENT
    return Length("\(intToString(int))pt")
  #endif
}

public func pt(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))pt")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))pt")
  #endif
}

public func rem(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))rem")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))rem")
  #endif
}

public func vw(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)vw")
  #endif
  #if CLIENT
    return Length("\(intToString(int))vw")
  #endif
}

public func vw(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))vw")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))vw")
  #endif
}

public func vh(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)vh")
  #endif
  #if CLIENT
    return Length("\(intToString(int))vh")
  #endif
}

public func vh(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))vh")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))vh")
  #endif
}

public func fr(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)fr")
  #endif
  #if CLIENT
    return Length("\(intToString(int))fr")
  #endif
}

public func fr(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))fr")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))fr")
  #endif
}

public func ch(_ int: Int) -> Length {
  #if SERVER
    return Length("\(int)ch")
  #endif
  #if CLIENT
    return Length("\(intToString(int))ch")
  #endif
}

public func ch(_ double: Double) -> Length {
  #if SERVER
    return Length("\(doubleToString(double))ch")
  #endif
  #if CLIENT
    return Length("\(doubleToString(double))ch")
  #endif
}

public func minmax(_ min: Length, _ max: Length) -> Length {
  #if SERVER
    return Length("minmax(\(min.value), \(max.value))")
  #endif
  #if CLIENT
    return Length("minmax(\(min.value), \(max.value))")
  #endif
}

public func `repeat`(_ count: GridRepeat, _ value: Length) -> Length {
  #if SERVER
    return Length("repeat(\(count.rawValue), \(value.value))")
  #endif
  #if CLIENT
    return Length("repeat(\(count.rawValue), \(value.value))")
  #endif
}

public func `repeat`(_ count: Int, _ value: Length) -> Length {
  #if SERVER
    return Length("repeat(\(count), \(value.value))")
  #endif
  #if CLIENT
    return Length("repeat(\(intToString(count)), \(value.value))")
  #endif
}

// Arithmetic operators for Length
public func + (lhs: Length, rhs: Length) -> Length {
  #if SERVER
    return Length("\(lhs.value) + \(rhs.value)")
  #endif
  #if CLIENT
    return Length("\(lhs.value) + \(rhs.value)")
  #endif
}

public func - (lhs: Length, rhs: Length) -> Length {
  #if SERVER
    return Length("\(lhs.value) - \(rhs.value)")
  #endif
  #if CLIENT
    return Length("\(lhs.value) - \(rhs.value)")
  #endif
}

// Unary negation operator
public prefix func - (value: Length) -> Length {
  #if SERVER
    return Length("-\(value.value)")
  #endif
  #if CLIENT
    return Length("-\(value.value)")
  #endif
}

@_disfavoredOverload
public func * (lhs: Length, rhs: Int) -> Length {
  #if SERVER
    return Length("\(lhs.value) * \(rhs)")
  #endif
  #if CLIENT
    return Length("\(lhs.value) * \(intToString(rhs))")
  #endif
}

@_disfavoredOverload
public func * (lhs: Int, rhs: Length) -> Length {
  #if SERVER
    return Length("\(lhs) * \(rhs.value)")
  #endif
  #if CLIENT
    return Length("\(intToString(lhs)) * \(rhs.value)")
  #endif
}

@_disfavoredOverload
public func * (lhs: Length, rhs: Double) -> Length {
  #if SERVER
    return Length("\(lhs.value) * \(doubleToString(rhs))")
  #endif
  #if CLIENT
    return Length("\(lhs.value) * \(doubleToString(rhs))")
  #endif
}

@_disfavoredOverload
public func * (lhs: Double, rhs: Length) -> Length {
  #if SERVER
    return Length("\(doubleToString(lhs)) * \(rhs.value)")
  #endif
  #if CLIENT
    return Length("\(doubleToString(lhs)) * \(rhs.value)")
  #endif
}

public func / (lhs: Length, rhs: Int) -> Length {
  #if SERVER
    return Length("\(lhs.value) / \(rhs)")
  #endif
  #if CLIENT
    return Length("\(lhs.value) / \(intToString(rhs))")
  #endif
}

public func / (lhs: Length, rhs: Double) -> Length {
  #if SERVER
    return Length("\(lhs.value) / \(doubleToString(rhs))")
  #endif
  #if CLIENT
    return Length("\(lhs.value) / \(doubleToString(rhs))")
  #endif
}

public func / (lhs: Length, rhs: Length) -> Length {
  #if SERVER
    return Length("(\(lhs.value)) / (\(rhs.value))")
  #endif
  #if CLIENT
    return Length("(\(lhs.value)) / (\(rhs.value))")
  #endif
}
