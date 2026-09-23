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

    /// A user-agent environment variable: `env(safe-area-inset-bottom)`.
    public static func environment(_ name: String) -> Length {
      Length("env(\(name))")
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


// Arithmetic on lengths. CSS does arithmetic only inside `calc()`, so every
// operator emits a whole `calc()` expression: a bare `4px * 2` is not a value
// any property accepts, and a declaration holding one is dropped. An operand
// that is itself one of these expressions goes in as a parenthesised term, so
// `(a + b) * 2` keeps its precedence and still reads as one `calc()`.

/// `calc(lhs op rhs)`, each side a term.
internal func cssCalculation(_ lhs: String, _ op: String, _ rhs: String) -> String {
  "calc(\(cssTerm(lhs)) \(op) \(cssTerm(rhs)))"
}

/// A value as one `calc()`: itself when it already is one.
internal func cssCalculation(_ value: String) -> String {
  let term = cssTerm(value)
  return stringEquals(term, value) ? "calc(\(value))" : value
}

/// A value as a term of a larger calculation: a `calc()` expression opens into
/// parentheses, and anything else stands as it is.
internal func cssTerm(_ value: String) -> String {
  let bytes = Array(value.utf8)
  let opening = Array("calc(".utf8)
  guard bytes.count > opening.count, Array(bytes[0..<opening.count]) == opening, bytes.last == 41 else {
    return value
  }
  // Only when that `calc(` closes at the very end: `calc(a) + calc(b)` is two
  // terms, not one.
  var depth = 0
  for index in (opening.count - 1)..<bytes.count {
    if bytes[index] == 40 { depth += 1 }
    if bytes[index] == 41 {
      depth -= 1
      if depth == 0 && index != bytes.count - 1 { return value }
    }
  }
  return "(" + String(decoding: bytes[opening.count..<(bytes.count - 1)], as: UTF8.self) + ")"
}

public func + (lhs: CSS.Length, rhs: CSS.Length) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "+", rhs.value))
}

public func - (lhs: CSS.Length, rhs: CSS.Length) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "-", rhs.value))
}

/// A plain dimension takes its sign directly, `-1px`, and loses it again
/// when negated twice; anything else — a variable, an expression — is
/// multiplied by -1, since `-var(--x)` is not a value.
public prefix func - (value: CSS.Length) -> CSS.Length {
  let bytes = Array(value.value.utf8)
  guard let first = bytes.first else { return value }
  if first == 45 {  // '-'
    let rest = String(decoding: bytes.dropFirst(), as: UTF8.self)
    if let second = bytes.dropFirst().first, (second >= 48 && second <= 57) || second == 46 {
      return CSS.Length(rest)
    }
  }
  if (first >= 48 && first <= 57) || first == 46 {  // a digit or '.'
    return CSS.Length("-" + value.value)
  }
  return CSS.Length(cssCalculation("-1", "*", value.value))
}

@_disfavoredOverload
public func * (lhs: CSS.Length, rhs: Int) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "*", intToString(rhs)))
}

@_disfavoredOverload
public func * (lhs: Int, rhs: CSS.Length) -> CSS.Length {
  CSS.Length(cssCalculation(intToString(lhs), "*", rhs.value))
}

@_disfavoredOverload
public func * (lhs: CSS.Length, rhs: Double) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "*", doubleToString(rhs)))
}

@_disfavoredOverload
public func * (lhs: Double, rhs: CSS.Length) -> CSS.Length {
  CSS.Length(cssCalculation(doubleToString(lhs), "*", rhs.value))
}

public func * (lhs: CSS.Percentage, rhs: Int) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "*", intToString(rhs)))
}

public func / (lhs: CSS.Length, rhs: Int) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "/", intToString(rhs)))
}

public func / (lhs: CSS.Length, rhs: Double) -> CSS.Length {
  CSS.Length(cssCalculation(lhs.value, "/", doubleToString(rhs)))
}
