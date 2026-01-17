#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public struct SVGColorMatrix: Sendable {
	public typealias Row = (Double, Double, Double, Double, Double)

	public let r: Row
	public let g: Row
	public let b: Row
	public let a: Row

	public init(
		_ r: Row,
		_ g: Row,
		_ b: Row,
		_ a: Row
	) {
		self.r = r
		self.g = g
		self.b = b
		self.a = a
	}

	#if !os(WASI)
	public var value: String {
		let rRow = "\(r.0) \(r.1) \(r.2) \(r.3) \(r.4)"
		let gRow = "\(g.0) \(g.1) \(g.2) \(g.3) \(g.4)"
		let bRow = "\(b.0) \(b.1) \(b.2) \(b.3) \(b.4)"
		let aRow = "\(a.0) \(a.1) \(a.2) \(a.3) \(a.4)"
		return "\(rRow)  \(gRow)  \(bRow)  \(aRow)"
	}
	#endif

	#if os(WASI)
	public var value: String {
		var buffer: [UInt8] = []
		
		func appendRow(_ row: (Double, Double, Double, Double, Double)) {
			buffer.append(contentsOf: doubleToString(row.0).utf8)
			buffer.append(32)
			buffer.append(contentsOf: doubleToString(row.1).utf8)
			buffer.append(32)
			buffer.append(contentsOf: doubleToString(row.2).utf8)
			buffer.append(32)
			buffer.append(contentsOf: doubleToString(row.3).utf8)
			buffer.append(32)
			buffer.append(contentsOf: doubleToString(row.4).utf8)
		}

		appendRow(r)
		buffer.append(contentsOf: "  ".utf8)
		appendRow(g)
		buffer.append(contentsOf: "  ".utf8)
		appendRow(b)
		buffer.append(contentsOf: "  ".utf8)
		appendRow(a)

		return String(decoding: buffer, as: UTF8.self)
	}
	#endif
}
