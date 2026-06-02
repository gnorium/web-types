import EmbeddedSwiftUtilities

extension CSS {
  // Time - CSSContent time values
  public struct Time: Sendable, CSSVariableConvertible {
    private enum Storage: Sendable {
      case dynamic(String)
      case `static`(StaticString)
    }

    private let storage: Storage

    public var value: String {
      switch storage {
      case .dynamic(let str): return str
      case .static(let str): return str.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
      }
    }

    public var staticRawValue: StaticString? {
      switch storage {
      case .static(let str): return str
      default: return nil
      }
    }

    internal init(_ value: String) {
      self.storage = .dynamic(value)
    }

    public static func variable(_ name: String) -> Time {
      Time("var(\(name))")
    }
  }
}

// Convenience functions

public func s(_ int: Int) -> CSS.Time {
  #if SERVER
    return CSS.Time("\(int)s")
  #endif
  #if CLIENT
    return CSS.Time("\(intToString(int))s")
  #endif
}

public func s(_ double: Double) -> CSS.Time {
  #if SERVER
    return CSS.Time("\(doubleToString(double))s")
  #endif
  #if CLIENT
    return CSS.Time("\(doubleToString(double))s")
  #endif
}

public func ms(_ int: Int) -> CSS.Time {
  #if SERVER
    return CSS.Time("\(int)ms")
  #endif
  #if CLIENT
    return CSS.Time("\(intToString(int))ms")
  #endif
}

public func ms(_ double: Double) -> CSS.Time {
  #if SERVER
    return CSS.Time("\(doubleToString(double))ms")
  #endif
  #if CLIENT
    return CSS.Time("\(doubleToString(double))ms")
  #endif
}
