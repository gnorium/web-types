import EmbeddedSwiftUtilities

// CSSTime - CSSContent time values
public struct CSSTime: Sendable, CSSVariableConvertible {
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

  public static func variable(_ name: String) -> CSSTime {
    CSSTime("var(\(name))")
  }
}

// Convenience functions

public func s(_ int: Int) -> CSSTime {
  #if SERVER
    return CSSTime("\(int)s")
  #endif
  #if CLIENT
    return CSSTime("\(intToString(int))s")
  #endif
}

public func s(_ double: Double) -> CSSTime {
  #if SERVER
    return CSSTime("\(doubleToString(double))s")
  #endif
  #if CLIENT
    return CSSTime("\(doubleToString(double))s")
  #endif
}

public func ms(_ int: Int) -> CSSTime {
  #if SERVER
    return CSSTime("\(int)ms")
  #endif
  #if CLIENT
    return CSSTime("\(intToString(int))ms")
  #endif
}

public func ms(_ double: Double) -> CSSTime {
  #if SERVER
    return CSSTime("\(doubleToString(double))ms")
  #endif
  #if CLIENT
    return CSSTime("\(doubleToString(double))ms")
  #endif
}
