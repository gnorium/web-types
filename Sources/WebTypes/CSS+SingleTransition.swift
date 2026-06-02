// <single-transition> = [ none | <single-transition-property> ] || <time> || <easing-function> || <time> || <transition-behavior-value>
extension CSS {
  public struct SingleTransition: Sendable {
    public let property: CSS.SingleTransitionProperty
    public let duration: CSS.Time
    public let easingFunction: CSS.EasingFunction
    public let delay: CSS.Time?
    public let behavior: CSS.TransitionBehaviorValue?

    public init(
      _ property: CSS.SingleTransitionProperty,
      _ duration: CSS.Time,
      _ easingFunction: CSS.EasingFunction,
      _ delay: CSS.Time? = nil,
      _ behavior: CSS.TransitionBehaviorValue? = nil
    ) {
      self.property = property
      self.duration = duration
      self.easingFunction = easingFunction
      self.delay = delay
      self.behavior = behavior
    }

    #if SERVER
      public var value: String {
        var components = [property.value, duration.value, easingFunction.value]
        if let delay = delay { components.append(delay.value) }
        if let behavior = behavior { components.append(behavior.rawValue) }
        return components.joined(separator: " ")
      }
    #endif

    #if CLIENT
      public var value: String {
        var buffer: [UInt8] = []

        func append(_ str: String) {
          buffer.append(contentsOf: str.utf8)
        }

        func append(_ staticStr: StaticString) {
          staticStr.withUTF8Buffer { buffer.append(contentsOf: $0) }
        }

        if let p = property.staticRawValue { append(p) } else { append(property.value) }
        buffer.append(32)
        if let d = duration.staticRawValue { append(d) } else { append(duration.value) }
        buffer.append(32)
        if let e = easingFunction.staticRawValue { append(e) } else { append(easingFunction.value) }
        if let delay = delay {
          buffer.append(32)
          if let del = delay.staticRawValue { append(del) } else { append(delay.value) }
        }
        if let behavior = behavior {
          buffer.append(32)
          append(behavior.rawValue)
        }
        return String(decoding: buffer, as: UTF8.self)
      }
    #endif
  }
}
