/// Namespace for SVGProtocol animation-related types.
/// Consolidates all SMIL animation enums under a single namespace.
public enum SVGAnimate {
	/// Repeat count for animations
	public enum RepeatCount: Equatable, Sendable {
		case indefinite
		case count(Int)
		
		public var value: String {
			switch self {
			case .indefinite: return "indefinite"
			case .count(let n): return String(n)
			}
		}
	}
	
	/// Calculation mode for animation interpolation
	public enum CalcMode: String, Sendable {
		case discrete
		case linear
		case paced
		case spline
	}
	
	/// Begin trigger for animations
	public enum Begin: String, Sendable {
		case indefinite
	}
	
	/// Fill behavior after animation ends
	public enum Fill: String, Sendable {
		case freeze
		case remove
	}
}
