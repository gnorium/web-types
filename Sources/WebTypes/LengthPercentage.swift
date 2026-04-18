public struct LengthPercentage: Sendable, CustomStringConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
	public let value: String

	public init(_ length: Length) {
		self.value = length.value
	}

	public init(_ percentage: Percentage) {
		self.value = percentage.value
	}

	internal init(_ value: String) {
		self.value = value
	}

	public init(integerLiteral value: Int) {
		self.value = "\(value)px"
	}

	public init(floatLiteral value: Double) {
		self.value = "\(value)px"
	}


	public var lengthPercentage: LengthPercentage {
		self
	}

	public var description: String {
		value
	}
}
