public struct ImageResource {
	public let src: String
	public let sizes: String?
	public let type: String?
	public let purpose: String?

	public init(src: String, sizes: String? = nil, type: String? = nil, purpose: String? = nil) {
		self.src = src
		self.sizes = sizes
		self.type = type
		self.purpose = purpose
	}

	public func toDictionary() -> [String: String] {
		var dict: [String: String] = ["src": src]
		if let sizes = sizes { dict["sizes"] = sizes }
		if let type = type { dict["type"] = type }
		if let purpose = purpose { dict["purpose"] = purpose }
		return dict
	}
}
