public enum CSSKeyword {
	/// The "none" keyword
	public enum None: String, Sendable {
		case none = "none"

		public var staticRawValue: StaticString {
			return "none"
		}
	}

	/// The "auto" keyword
	public enum Auto: String, Sendable {
		case auto = "auto"

		public var staticRawValue: StaticString {
			return "auto"
		}
	}

	public enum All: String, Sendable {
		case all = "all"
        
        public var staticRawValue: StaticString {
            "all"
        }
	}

	/// The "infinite" keyword
	public enum Infinite: String, Sendable {
		case infinite = "infinite"
	}

	/// Length keywords
	public enum Length: String, Sendable {
		case maxContent = "max-content"
		case minContent = "min-content"
		case fitContent = "fit-content"
		case stretch = "stretch"
	}

	public enum Global: String, CustomStringConvertible, Sendable {
		case inherit = "inherit"
		case initial = "initial"
		case revert = "revert"
		case revertLayer = "revert-layer"
		case unset = "unset"

		public var description: String {
			rawValue
		}
	}

	public enum Visibility: String, Sendable {
		case visible = "visible"
		case hidden = "hidden"
		case collapse = "collapse"
	}

	public enum CurrentColor: String, Sendable {
		case currentColor = "currentColor"
	}

	public enum Transparent: String, Sendable {
		case transparent = "transparent"
	}
}
