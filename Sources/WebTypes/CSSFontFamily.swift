#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <font-family> = [ <family-name> | <generic-family> ]#
public struct CSSFontFamily: CustomStringConvertible, Sendable, CSSVariableConvertible {
	public let value: String

	public var description: String { value }

	internal init(_ value: String) {
		self.value = value
	}

	public static func variable(_ name: String) -> CSSFontFamily {
		CSSFontFamily(concat("var(", name, ")"))
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
	public init(_ font1: FamilyName, _ font2: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.rawValue)
	}

	public init(_ font1: FamilyName, _ font2: GenericFamily.GenericIncomplete) {
		self.value = concat(font1.value, ", ", font2.rawValue)
	}

	public init(_ font1: FamilyName, _ font2: GenericFamily.GenericScriptSpecific) {
		self.value = concat(font1.value, ", ", font2.value)
	}

	// Font stack with 3 fonts
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.rawValue)
	}

	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: GenericFamily.GenericIncomplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.rawValue)
	}

	public init(_ font1: FamilyName, _ font2: GenericFamily.GenericIncomplete, _ font3: CSSFontFamily) {
		self.value = concat(font1.value, ", ", font2.rawValue, ", ", font3.value)
	}

	// Font stack with 4 fonts
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: FamilyName, _ font4: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.value, ", ", font4.rawValue)
	}

	// Font stack with 5 fonts
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: FamilyName, _ font4: FamilyName, _ font5: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.value, ", ", font4.value, ", ", font5.rawValue)
	}

	// Font stack with 6 fonts
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: FamilyName, _ font4: FamilyName, _ font5: FamilyName, _ font6: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.value, ", ", font4.value, ", ", font5.value, ", ", font6.rawValue)
	}

	// Font stack with 7 fonts
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: FamilyName, _ font4: FamilyName, _ font5: FamilyName, _ font6: FamilyName, _ font7: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.value, ", ", font4.value, ", ", font5.value, ", ", font6.value, ", ", font7.rawValue)
	}

	// Font stack with 8 fonts (for the system sans case)
	public init(_ font1: FamilyName, _ font2: FamilyName, _ font3: FamilyName, _ font4: FamilyName, _ font5: FamilyName, _ font6: FamilyName, _ font7: FamilyName, _ font8: GenericFamily.GenericComplete) {
		self.value = concat(font1.value, ", ", font2.value, ", ", font3.value, ", ", font4.value, ", ", font5.value, ", ", font6.value, ", ", font7.value, ", ", font8.rawValue)
	}

	// <family-name> = <string> | <custom-ident>+
	public struct FamilyName: Sendable {
		public let value: String

		internal init(_ value: String) {
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
