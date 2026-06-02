#if CLIENT
  import EmbeddedSwiftUtilities
#endif

extension CSS {
  public struct View: Sendable {
    public let axis: CSS.Axis?
    public let inset: CSS.ViewTimelineInset?

    public init(axis: CSS.Axis? = nil, inset: CSS.ViewTimelineInset? = nil) {
      self.axis = axis
      self.inset = inset
    }

    #if SERVER
      public var value: String {
        var components: [String] = []
        if let axis = axis {
          components.append(axis.rawValue)
        }
        if let inset = inset {
          components.append(inset.value)
        }

        if components.isEmpty {
          return "view()"
        }
        return "view(\(components.joined(separator: " ")))"
      }
    #endif

    #if CLIENT
      public var value: String {
        var buffer: [UInt8] = []
        buffer.append(contentsOf: "view(".utf8)

        var hasContent = false
        if let axis = axis {
          buffer.append(contentsOf: axis.rawValue.utf8)
          hasContent = true
        }
        if let inset = inset {
          if hasContent { buffer.append(32) }
          buffer.append(contentsOf: inset.value.utf8)
        }

        buffer.append(41)  // ')'
        return String(decoding: buffer, as: UTF8.self)
      }
    #endif
  }
}

// Convenience helper function
public func view(_ axis: CSS.Axis? = nil, _ inset: CSS.ViewTimelineInset? = nil) -> CSS.View {
  CSS.View(axis: axis, inset: inset)
}
