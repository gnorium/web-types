/// Union type for CSSProtocol properties that accept either Length or Percentage
public struct LengthPercentage: Sendable, ExpressibleByStringLiteral, CustomStringConvertible {
	public let value: String

	public init(_ length: Length) {
		self.value = length.value
	}

	public init(_ percentage: Percentage) {
		self.value = percentage.value
	}

	public init(_ string: String) {
		self.value = string
	}

	public init(stringLiteral value: String) {
		self.value = value
	}

	public var description: String {
		value
	}
}

// Allow direct assignment from Length and Percentage
extension Length {
	public var lengthPercentage: LengthPercentage {
		LengthPercentage(self)
	}
}

extension Percentage {
	public var lengthPercentage: LengthPercentage {
		LengthPercentage(self)
	}
}
