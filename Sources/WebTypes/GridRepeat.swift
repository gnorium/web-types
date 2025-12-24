public enum GridRepeat: String, CustomStringConvertible {
	case autoFit = "auto-fit"
	case autoFill = "auto-fill"

	public var description: String { rawValue }
}
