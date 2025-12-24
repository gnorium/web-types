// <animation-delay> = <time>#
public struct CSSAnimationDelay: Sendable {
	public let time: CSSTime

	public init(_ time: CSSTime) {
		self.time = time
	}

	public var value: String {
		time.value
	}
}
