#if CLIENT
  import EmbeddedSwiftUtilities
#endif

public enum CSSEasingFunction: Sendable, CSSVariableConvertible {
  case linear(LinearEasingFunction)
  case cubicBezier(CubicBezierEasingFunction)
  case step(StepEasingFunction)
  case variable(String)

  public enum LinearEasingFunction: Sendable {
    case linear
    case linearFunction(String)

    public var value: String {
      switch self {
      case .linear:
        return "linear"
      case .linearFunction(let fn):
        return fn
      }
    }
  }

  public enum CubicBezierEasingFunction: Sendable {
    case ease
    case easeIn
    case easeOut
    case easeInOut
    case cubicBezierFunction(String)

    public var value: String {
      switch self {
      case .ease:
        return "ease"
      case .easeIn:
        return "ease-in"
      case .easeOut:
        return "ease-out"
      case .easeInOut:
        return "ease-in-out"
      case .cubicBezierFunction(let fn):
        return fn
      }
    }
  }

  public enum StepEasingFunction: Sendable {
    case stepStart
    case stepEnd
    case stepsFunction(String)

    public var value: String {
      switch self {
      case .stepStart:
        return "step-start"
      case .stepEnd:
        return "step-end"
      case .stepsFunction(let fn):
        return fn
      }
    }
  }

  public var value: String {
    switch self {
    case .linear(let linear):
      return linear.value
    case .cubicBezier(let cubicBezier):
      return cubicBezier.value
    case .step(let step):
      return step.value
    case .variable(let name):
      return "var(\(name))"
    }
  }

  public var staticRawValue: StaticString? {
    switch self {
    case .linear(let l):
      switch l {
      case .linear: return "linear"
      case .linearFunction: return nil
      }
    case .cubicBezier(let cb):
      switch cb {
      case .ease: return "ease"
      case .easeIn: return "ease-in"
      case .easeOut: return "ease-out"
      case .easeInOut: return "ease-in-out"
      case .cubicBezierFunction: return nil
      }
    case .step(let s):
      switch s {
      case .stepStart: return "step-start"
      case .stepEnd: return "step-end"
      case .stepsFunction: return nil
      }
    case .variable:
      return nil
    }
  }
}

extension CSSEasingFunction {
  public static var linear: CSSEasingFunction {
    .linear(.linear)
  }

  public static var ease: CSSEasingFunction {
    .cubicBezier(.ease)
  }

  public static var easeIn: CSSEasingFunction {
    .cubicBezier(.easeIn)
  }

  public static var easeOut: CSSEasingFunction {
    .cubicBezier(.easeOut)
  }

  public static var easeInOut: CSSEasingFunction {
    .cubicBezier(.easeInOut)
  }

  public static var stepStart: CSSEasingFunction {
    .step(.stepStart)
  }

  public static var stepEnd: CSSEasingFunction {
    .step(.stepEnd)
  }

  public static func cubicBezier(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double)
    -> CSSEasingFunction
  {
    #if SERVER
      return .cubicBezier(.cubicBezierFunction("cubic-bezier(\(x1), \(y1), \(x2), \(y2))"))

    #endif

    #if CLIENT
      return .cubicBezier(
        .cubicBezierFunction(
          "cubic-bezier(\(doubleToString(x1)), \(doubleToString(y1)), \(doubleToString(x2)), \(doubleToString(y2)))"
        ))

    #endif
  }

  public static func steps(_ count: Int, _ position: CSSStepPosition? = nil) -> CSSEasingFunction {
    if let position = position {
      #if SERVER
        return .step(.stepsFunction("steps(\(count), \(position.rawValue))"))

      #endif

      #if CLIENT
        return .step(.stepsFunction("steps(\(intToString(count)), \(position.rawValue))"))
      #endif
    }
    #if SERVER
      return .step(.stepsFunction("steps(\(count))"))

    #endif

    #if CLIENT
      return .step(.stepsFunction("steps(\(intToString(count)))"))
    #endif
  }
}
