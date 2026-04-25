// <single-transition> = [ none | <single-transition-property> ] || <time> || <easing-function> || <time> || <transition-behavior-value>
public struct CSSSingleTransition: Sendable {
  public let property: CSSSingleTransitionProperty
  public let duration: CSSTime
  public let easingFunction: CSSEasingFunction
  public let delay: CSSTime?
  public let behavior: CSSTransitionBehaviorValue?

  public init(
    _ property: CSSSingleTransitionProperty,
    _ duration: CSSTime,
    _ easingFunction: CSSEasingFunction,
    _ delay: CSSTime? = nil,
    _ behavior: CSSTransitionBehaviorValue? = nil
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
      if let delay = delay {
        components.append(delay.value)
      }
      if let behavior = behavior {
        components.append(behavior.rawValue)
      }
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
      buffer.append(32)  // space
      if let d = duration.staticRawValue { append(d) } else { append(duration.value) }
      buffer.append(32)  // space
      if let e = easingFunction.staticRawValue { append(e) } else { append(easingFunction.value) }

      if let delay = delay {
        buffer.append(32)  // space
        if let del = delay.staticRawValue { append(del) } else { append(delay.value) }
      }
      if let behavior = behavior {
        buffer.append(32)  // space
        append(behavior.rawValue)
      }
      return String(decoding: buffer, as: UTF8.self)
    }
  #endif
}
