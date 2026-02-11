/// CSSProtocol writing-mode property values
/// Controls block flow direction and inline base direction
public enum CSSWritingMode: String, Sendable {
	/// Horizontal lines, top to bottom (default for LTR/RTL scripts)
	case horizontalTb = "horizontal-tb"
	/// Vertical lines, right to left (traditional CJK)
	case verticalRl = "vertical-rl"
	/// Vertical lines, left to right (Mongolian)
	case verticalLr = "vertical-lr"
	/// Sideways lines, right to left
	case sidewaysRl = "sideways-rl"
	/// Sideways lines, left to right
	case sidewaysLr = "sideways-lr"
}
