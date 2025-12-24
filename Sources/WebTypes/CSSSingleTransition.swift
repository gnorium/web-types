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

	#if !os(WASI)
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

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		buffer.append(contentsOf: property.value.utf8)
		buffer.append(32) // space
		buffer.append(contentsOf: duration.value.utf8)
		buffer.append(32) // space
		buffer.append(contentsOf: easingFunction.value.utf8)
		if let delay = delay {
			buffer.append(32) // space
			buffer.append(contentsOf: delay.value.utf8)
		}
		if let behavior = behavior {
			buffer.append(32) // space
			buffer.append(contentsOf: behavior.rawValue.utf8)
		}
		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}
