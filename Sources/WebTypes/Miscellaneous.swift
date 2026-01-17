#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public func url(_ string: String) -> String {
	concat("url(", string, ")")
}

public func calc(_ string: String) -> String {
	concat("calc(", string, ")")
}

public func calc(_ length: Length) -> String {
	concat("calc(", length.value, ")")
}

public func calc(_ percentage: Percentage) -> String {
	concat("calc(", percentage.value, ")")
}

public func calc(_ value: LengthPercentage) -> String {
	concat("calc(", value.value, ")")
}

public func max(_ values: Length...) -> String {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: "max(".utf8)
	for (index, value) in values.enumerated() {
		if index > 0 {
			buffer.append(contentsOf: ", ".utf8)
		}
		buffer.append(contentsOf: value.value.utf8)
	}
	buffer.append(41) // ')'
	return String(decoding: buffer, as: UTF8.self)
}

public func max(_ values: String...) -> String {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: "max(".utf8)
	for (index, value) in values.enumerated() {
		if index > 0 {
			buffer.append(contentsOf: ", ".utf8)
		}
		buffer.append(contentsOf: value.utf8)
	}
	buffer.append(41) // ')'
	return String(decoding: buffer, as: UTF8.self)
}

public func max(_ value1: String, _ value2: Length) -> String {
	return concat("max(", value1, ", ", value2.value, ")")
}

public func max(_ value1: Length, _ value2: String) -> String {
	return concat("max(", value1.value, ", ", value2, ")")
}

public func min(_ values: Length...) -> String {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: "min(".utf8)
	for (index, value) in values.enumerated() {
		if index > 0 {
			buffer.append(contentsOf: ", ".utf8)
		}
		buffer.append(contentsOf: value.value.utf8)
	}
	buffer.append(41) // ')'
	return String(decoding: buffer, as: UTF8.self)
}

public func min(_ values: String...) -> String {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: "min(".utf8)
	for (index, value) in values.enumerated() {
		if index > 0 {
			buffer.append(contentsOf: ", ".utf8)
		}
		buffer.append(contentsOf: value.utf8)
	}
	buffer.append(41) // ')'
	return String(decoding: buffer, as: UTF8.self)
}

public func min(_ value1: String, _ value2: Length) -> String {
	return concat("min(", value1, ", ", value2.value, ")")
}

public func min(_ value1: Length, _ value2: String) -> String {
	return concat("min(", value1.value, ", ", value2, ")")
}

public func clamp(_ min: Length, _ preferred: Length, _ max: Length) -> String {
	return concat("clamp(", min.value, ", ", preferred.value, ", ", max.value, ")")
}

public func clamp(_ min: String, _ preferred: String, _ max: String) -> String {
	return concat("clamp(", min, ", ", preferred, ", ", max, ")")
}

public func clamp(_ min: Length, _ preferred: String, _ max: Length) -> String {
	return concat("clamp(", min.value, ", ", preferred, ", ", max.value, ")")
}

public func clamp(_ min: String, _ preferred: Length, _ max: String) -> String {
	return concat("clamp(", min, ", ", preferred.value, ", ", max, ")")
}

#if !os(WASI)

public func rect(_ top: Int, _ right: Int, _ bottom: Int, _ left: Int) -> String {
	concat("rect(", "\(top)", "px, ", "\(right)", "px, ", "\(bottom)", "px, ", "\(left)", "px)")
}

#endif

#if os(WASI)

public func rect(_ top: Int, _ right: Int, _ bottom: Int, _ left: Int) -> String {
	concat("rect(", intToString(top), "px, ", intToString(right), "px, ", intToString(bottom), "px, ", intToString(left), "px)")
}

#endif

public func rect(_ top: Length, _ right: Length, _ bottom: Length, _ left: Length) -> String {
	concat("rect(", top.value, ", ", right.value, ", ", bottom.value, ", ", left.value, ")")
}

public func orientation(_ value: CSSOrientation) -> String {
	value.rawValue.withUTF8Buffer { buffer in
		let str = String(decoding: buffer, as: UTF8.self)
		return concat("(orientation: ", str, ")")
	}
}

public func prefersColorScheme(_ scheme: CSSPrefersColorScheme) -> StaticString {
	switch scheme {
	case .light:
		return "(prefers-color-scheme: light)"
	case .dark:
		return "(prefers-color-scheme: dark)"
	}
}

public func prefersContrast(_ scheme: CSSPrefersContrast) -> StaticString {
	switch scheme {
	case .more:
		return "(prefers-contrast: more)"
	case .less:
		return "(prefers-contrast: less)"
	case .noPreference:
		return "(prefers-contrast: no-preference)"
	}
}

// Operators for calc() expressions are now in Length.swift

public func data(_ name: String) -> String {
	var buffer: [UInt8] = []
	buffer.append(contentsOf: "data-".utf8)
	buffer.append(contentsOf: name.utf8)
	return String(decoding: buffer, as: UTF8.self)
}

public func +(lhs: Percentage, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " + ", rhs.value))
}

public func -(lhs: Percentage, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " - ", rhs.value))
}

public func *(lhs: Percentage, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " * ", rhs.value))
}

public func /(lhs: Percentage, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " / ", rhs.value))
}

public func +(lhs: Length, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " + ", rhs.value))
}

public func -(lhs: Length, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " - ", rhs.value))
}

public func *(lhs: Length, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " * ", rhs.value))
}

public func /(lhs: Length, rhs: Percentage) -> Length {
	Length(concat(lhs.value, " / ", rhs.value))
}

public func +(lhs: Percentage, rhs: Length) -> Length {
	Length(concat(lhs.value, " + ", rhs.value))
}

public func -(lhs: Percentage, rhs: Length) -> Length {
	Length(concat(lhs.value, " - ", rhs.value))
}

public func *(lhs: Percentage, rhs: Length) -> Length {
	Length(concat(lhs.value, " * ", rhs.value))
}

public func /(lhs: Percentage, rhs: Length) -> Length {
	Length(concat(lhs.value, " / ", rhs.value))
}

public func concat(_ parts: String...) -> String {
	var buffer: [UInt8] = []
	for part in parts {
		buffer.append(contentsOf: part.utf8)
	}
	return String(decoding: buffer, as: UTF8.self)
}
