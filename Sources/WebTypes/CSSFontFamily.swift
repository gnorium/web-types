#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <font-family> = [ <family-name> | <generic-family> ]#
public struct CSSFontFamily: ExpressibleByStringLiteral, CustomStringConvertible, Sendable {
	public let value: String

	public var description: String { value }

	public init(stringLiteral value: String) {
		self.value = value
	}

	public init(_ value: String) {
		self.value = value
	}

	// <family-name>
	public init(_ familyName: FamilyName) {
		self.value = familyName.value
	}

	// <generic-family>
	public init(_ generic: GenericFamily) {
		self.value = generic.value
	}

	// Single generic families
	public init(_ generic: GenericFamily.GenericComplete) {
		self.value = generic.rawValue
	}

	public init(_ generic: GenericFamily.GenericIncomplete) {
		self.value = generic.rawValue
	}

	public init(_ generic: GenericFamily.GenericScriptSpecific) {
		self.value = generic.value
	}

	// Font stack with 2 fonts
	public init(_ font1: String, _ font2: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2.rawValue)
	}

	public init(_ font1: String, _ font2: GenericFamily.GenericIncomplete) {
		self.value = concat(font1, ", ", font2.rawValue)
	}

	public init(_ font1: String, _ font2: GenericFamily.GenericScriptSpecific) {
		self.value = concat(font1, ", ", font2.value)
	}

	// Font stack with 3 fonts
	public init(_ font1: String, _ font2: String, _ font3: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3.rawValue)
	}

	public init(_ font1: String, _ font2: String, _ font3: GenericFamily.GenericIncomplete) {
		self.value = concat(font1, ", ", font2, ", ", font3.rawValue)
	}

	public init(_ font1: String, _ font2: GenericFamily.GenericIncomplete, _ font3: CSSFontFamily) {
		self.value = concat(font1, ", ", font2.rawValue, ", ", font3.value)
	}

	// Font stack with 4 fonts
	public init(_ font1: String, _ font2: String, _ font3: String, _ font4: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3, ", ", font4.rawValue)
	}

	// Font stack with 5 fonts
	public init(_ font1: String, _ font2: String, _ font3: String, _ font4: String, _ font5: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3, ", ", font4, ", ", font5.rawValue)
	}

	// Font stack with 6 fonts
	public init(_ font1: String, _ font2: String, _ font3: String, _ font4: String, _ font5: String, _ font6: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3, ", ", font4, ", ", font5, ", ", font6.rawValue)
	}

	// Font stack with 7 fonts
	public init(_ font1: String, _ font2: String, _ font3: String, _ font4: String, _ font5: String, _ font6: String, _ font7: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3, ", ", font4, ", ", font5, ", ", font6, ", ", font7.rawValue)
	}

	// Font stack with 8 fonts (for the system sans case)
	public init(_ font1: String, _ font2: String, _ font3: String, _ font4: String, _ font5: String, _ font6: String, _ font7: String, _ font8: GenericFamily.GenericComplete) {
		self.value = concat(font1, ", ", font2, ", ", font3, ", ", font4, ", ", font5, ", ", font6, ", ", font7, ", ", font8.rawValue)
	}

	// <family-name> = <string> | <custom-ident>+
	public struct FamilyName: ExpressibleByStringLiteral, Sendable {
		public let value: String

		// <string> (quoted font name like "Arial")
		public init(stringLiteral value: String) {
			self.value = value
		}

		public init(_ value: String) {
			self.value = value
		}

		// <custom-ident>+ (unquoted like Times New Roman)
		public init(customIdent: String) {
			self.value = customIdent
		}
	}

	// <generic-family> = <generic-script-specific> | <generic-complete> | <generic-incomplete>
	public enum GenericFamily: Sendable {
		case genericScriptSpecific(GenericScriptSpecific)
		case genericComplete(GenericComplete)
		case genericIncomplete(GenericIncomplete)

		public var value: String {
			switch self {
			case .genericScriptSpecific(let generic): return generic.value
			case .genericComplete(let generic): return generic.rawValue
			case .genericIncomplete(let generic): return generic.rawValue
			}
		}

		// <generic-complete>
		public enum GenericComplete: String, CustomStringConvertible, Sendable {
			public var description: String { rawValue }

			case serif = "serif"
			case sansSerif = "sans-serif"
			case cursive = "cursive"
			case fantasy = "fantasy"
			case monospace = "monospace"
			case systemUi = "system-ui"
			case emoji = "emoji"
			case math = "math"
			case fangsong = "fangsong"
		}

		// <generic-incomplete>
		public enum GenericIncomplete: String, CustomStringConvertible, Sendable {
			public var description: String { rawValue }

			case uiSerif = "ui-serif"
			case uiSansSerif = "ui-sans-serif"
			case uiMonospace = "ui-monospace"
			case uiRounded = "ui-rounded"
		}

		// <generic-script-specific>
		public enum GenericScriptSpecific: String, Sendable {
			case fangsong = "fangsong"
			case kai = "kai"
			case khmerMul = "khmer-mul"
			case nastaliq = "nastaliq"

			public var value: String {
				concat("generic(", rawValue, ")")
			}
		}
	}
}
