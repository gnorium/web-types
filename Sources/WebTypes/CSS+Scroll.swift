#if CLIENT
  import EmbeddedSwiftUtilities
#endif

// <scroll()> = scroll( [ <scroller> || <axis> ]? )
extension CSS {
  public struct Scroll: Sendable {
    public let scroller: CSS.Scroller?
    public let axis: CSS.Axis?

    public init(scroller: CSS.Scroller? = nil, axis: CSS.Axis? = nil) {
      self.scroller = scroller
      self.axis = axis
    }

    #if SERVER
      public var value: String {
        var components: [String] = []
        if let scroller = scroller {
          components.append(scroller.rawValue)
        }
        if let axis = axis {
          components.append(axis.rawValue)
        }

        if components.isEmpty {
          return "scroll()"
        }
        return "scroll(\(components.joined(separator: " ")))"
      }
    #endif

    #if CLIENT
      public var value: String {
        var buffer: [UInt8] = []
        buffer.append(contentsOf: "scroll(".utf8)

        var hasContent = false
        if let scroller = scroller {
          buffer.append(contentsOf: scroller.rawValue.utf8)
          hasContent = true
        }
        if let axis = axis {
          if hasContent { buffer.append(32) }
          buffer.append(contentsOf: axis.rawValue.utf8)
        }

        buffer.append(41)  // ')'
        return String(decoding: buffer, as: UTF8.self)
      }
    #endif
  }
}

// Convenience helper function
public func scroll(_ scroller: CSS.Scroller? = nil, _ axis: CSS.Axis? = nil) -> CSS.Scroll {
  CSS.Scroll(scroller: scroller, axis: axis)
}
