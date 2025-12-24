// <single-animation> = <'animation-duration'> || <easing-function> || <'animation-delay'> || <single-animation-iteration-count> || <single-animation-direction> || <single-animation-fill-mode> || <single-animation-play-state> || [ none | <keyframes-name> ] || <single-animation-timeline>
public struct CSSSingleAnimation: Sendable {
	public let duration: CSSAnimationDuration?
	public let easingFunction: CSSEasingFunction?
	public let delay: CSSAnimationDelay?
	public let iterationCount: CSSSingleAnimationIterationCount?
	public let direction: CSSSingleAnimationDirection?
	public let fillMode: CSSSingleAnimationFillMode?
	public let playState: CSSSingleAnimationPlayState?
	public let name: CSSKeyframesName?
	public let timeline: CSSSingleAnimationTimeline?

	public init(
		duration: CSSAnimationDuration? = nil,
		easingFunction: CSSEasingFunction? = nil,
		delay: CSSAnimationDelay? = nil,
		iterationCount: CSSSingleAnimationIterationCount? = nil,
		direction: CSSSingleAnimationDirection? = nil,
		fillMode: CSSSingleAnimationFillMode? = nil,
		playState: CSSSingleAnimationPlayState? = nil,
		name: CSSKeyframesName? = nil,
		timeline: CSSSingleAnimationTimeline? = nil
	) {
		self.duration = duration
		self.easingFunction = easingFunction
		self.delay = delay
		self.iterationCount = iterationCount
		self.direction = direction
		self.fillMode = fillMode
		self.playState = playState
		self.name = name
		self.timeline = timeline
	}

	#if !os(WASI)
	public var value: String {
		var components: [String] = []
		if let duration = duration {
			components.append(duration.value)
		}
		if let easingFunction = easingFunction {
			components.append(easingFunction.value)
		}
		if let delay = delay {
			components.append(delay.value)
		}
		if let iterationCount = iterationCount {
			components.append(iterationCount.value)
		}
		if let direction = direction {
			components.append(direction.rawValue)
		}
		if let fillMode = fillMode {
			components.append(fillMode.rawValue)
		}
		if let playState = playState {
			components.append(playState.rawValue)
		}
		if let name = name {
			components.append(name.value)
		}
		if let timeline = timeline {
			components.append(timeline.value)
		}
		return components.joined(separator: " ")
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		var hasContent = false
		if let duration = duration {
			buffer.append(contentsOf: duration.value.utf8)
			hasContent = true
		}
		if let easingFunction = easingFunction {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: easingFunction.value.utf8)
			hasContent = true
		}
		if let delay = delay {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: delay.value.utf8)
			hasContent = true
		}
		if let iterationCount = iterationCount {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: iterationCount.value.utf8)
			hasContent = true
		}
		if let direction = direction {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: direction.rawValue.utf8)
			hasContent = true
		}
		if let fillMode = fillMode {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: fillMode.rawValue.utf8)
			hasContent = true
		}
		if let playState = playState {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: playState.rawValue.utf8)
			hasContent = true
		}
		if let name = name {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: name.value.utf8)
			hasContent = true
		}
		if let timeline = timeline {
			if hasContent { buffer.append(32) }
			buffer.append(contentsOf: timeline.value.utf8)
		}
		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}
