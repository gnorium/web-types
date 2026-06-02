// <single-animation> = <'animation-duration'> || <easing-function> || <'animation-delay'> || <single-animation-iteration-count> || <single-animation-direction> || <single-animation-fill-mode> || <single-animation-play-state> || [ none | <keyframes-name> ] || <single-animation-timeline>
extension CSS {
  public struct SingleAnimation: Sendable {
    public let duration: CSS.AnimationDuration?
    public let easingFunction: CSS.EasingFunction?
    public let delay: CSS.AnimationDelay?
    public let iterationCount: CSS.SingleAnimationIterationCount?
    public let direction: CSS.SingleAnimationDirection?
    public let fillMode: CSS.SingleAnimationFillMode?
    public let playState: CSS.SingleAnimationPlayState?
    public let name: CSS.KeyframesName?
    public let timeline: CSS.SingleAnimationTimeline?

    public init(
      duration: CSS.AnimationDuration? = nil,
      easingFunction: CSS.EasingFunction? = nil,
      delay: CSS.AnimationDelay? = nil,
      iterationCount: CSS.SingleAnimationIterationCount? = nil,
      direction: CSS.SingleAnimationDirection? = nil,
      fillMode: CSS.SingleAnimationFillMode? = nil,
      playState: CSS.SingleAnimationPlayState? = nil,
      name: CSS.KeyframesName? = nil,
      timeline: CSS.SingleAnimationTimeline? = nil
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

    #if SERVER
      public var value: String {
        var components: [String] = []
        if let duration = duration { components.append(duration.value) }
        if let easingFunction = easingFunction { components.append(easingFunction.value) }
        if let delay = delay { components.append(delay.value) }
        if let iterationCount = iterationCount { components.append(iterationCount.value) }
        if let direction = direction { components.append(direction.rawValue) }
        if let fillMode = fillMode { components.append(fillMode.rawValue) }
        if let playState = playState { components.append(playState.rawValue) }
        if let name = name { components.append(name.value) }
        if let timeline = timeline { components.append(timeline.value) }
        return components.joined(separator: " ")
      }
    #endif

    #if CLIENT
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
}
