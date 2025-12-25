#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <easing-function> = <linear-easing-function> | <cubic-bezier-easing-function> | <step-easing-function>
public enum CSSEasingFunction: ExpressibleByStringLiteral, Sendable {
	case linear(LinearEasingFunction)
	case cubicBezier(CubicBezierEasingFunction)
	case step(StepEasingFunction)
    case customStatic(StaticString)

	// <linear-easing-function> = linear | <linear()>
	public enum LinearEasingFunction: Sendable {
		case linear
		case linearFunction(String) // linear(...)

		public var value: String {
			switch self {
			case .linear:
				return "linear"
			case .linearFunction(let fn):
				return fn
			}
		}
	}

	// <cubic-bezier-easing-function> = ease | ease-in | ease-out | ease-in-out | <cubic-bezier()>
	public enum CubicBezierEasingFunction: Sendable {
		case ease
		case easeIn
		case easeOut
		case easeInOut
		case cubicBezierFunction(String) // cubic-bezier(...)

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

	// <step-easing-function> = step-start | step-end | <steps()>
	public enum StepEasingFunction: Sendable {
		case stepStart
		case stepEnd
		case stepsFunction(String) // steps(...)

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

	public init(_ string: String) {
        #if os(WASI)
        
        // Unconditionally wrap to avoid unsafe comparison
        // We wrap in cubicBezierFunction as a generic container for string values
        self = .cubicBezier(.cubicBezierFunction(string))
        
        #endif

        #if !os(WASI)
		
        // Try to parse common values, otherwise treat as custom
		switch string {
		case "linear":
			self = .linear(.linear)
		case "ease":
			self = .cubicBezier(.ease)
		case "ease-in":
			self = .cubicBezier(.easeIn)
		case "ease-out":
			self = .cubicBezier(.easeOut)
		case "ease-in-out":
			self = .cubicBezier(.easeInOut)
		case "step-start":
			self = .step(.stepStart)
		case "step-end":
			self = .step(.stepEnd)
		default:
			// Assume it's a custom function or var()
			if CSSEasingFunction.safeHasPrefix(string, "cubic-bezier") || CSSEasingFunction.safeHasPrefix(string, "var(") {
				self = .cubicBezier(.cubicBezierFunction(string))
			} else if CSSEasingFunction.safeHasPrefix(string, "steps") {
				self = .step(.stepsFunction(string))
			} else if CSSEasingFunction.safeHasPrefix(string, "linear(") {
				self = .linear(.linearFunction(string))
			} else {
				// Default to treating as custom cubic-bezier
				self = .cubicBezier(.cubicBezierFunction(string))
			}
		}
       
        #endif
	}

    private static func safeHasPrefix(_ string: String, _ prefix: String) -> Bool {
        let strUtf8 = string.utf8
        let pfxUtf8 = prefix.utf8
        if strUtf8.count < pfxUtf8.count { return false }
        
        var strIdx = strUtf8.startIndex
        var pfxIdx = pfxUtf8.startIndex
        
        while pfxIdx < pfxUtf8.endIndex {
            if strUtf8[strIdx] != pfxUtf8[pfxIdx] {
                return false
            }
            strIdx = strUtf8.index(after: strIdx)
            pfxIdx = pfxUtf8.index(after: pfxIdx)
        }
        return true
    }

	public typealias StringLiteralType = StaticString
	public init(stringLiteral value: StaticString) {
		self = .customStatic(value)
	}

	public var value: String {
		switch self {
		case .linear(let linear):
			return linear.value
		case .cubicBezier(let cubicBezier):
			return cubicBezier.value
		case .step(let step):
			return step.value
        case .customStatic(let str):
            return str.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
		}
	}

    public var staticValue: StaticString? {
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
        case .customStatic(let s):
            return s
        }
    }
}

// Convenience extensions for clean syntax
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

	public static func cubicBezier(_ x1: Double, _ y1: Double, _ x2: Double, _ y2: Double) -> CSSEasingFunction {
		.cubicBezier(.cubicBezierFunction("cubic-bezier(\(x1), \(y1), \(x2), \(y2))"))
	}

	public static func steps(_ count: Int, _ position: CSSStepPosition? = nil) -> CSSEasingFunction {
		if let position = position {
			return .step(.stepsFunction("steps(\(count), \(position.rawValue))"))
		}
		return .step(.stepsFunction("steps(\(count))"))
	}
}
