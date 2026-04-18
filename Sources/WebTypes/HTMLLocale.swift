public struct HTMLLocale: CustomStringConvertible, Sendable {
	public let value: String

	internal init(_ value: String) {
		self.value = value
	}

	public var description: String {
		value
	}

	// Common locales
	public static let enUS = HTMLLocale("en_US")
	public static let enGB = HTMLLocale("en_GB")
}
