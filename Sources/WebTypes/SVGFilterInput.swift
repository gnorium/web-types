public struct SVGFilterInput: Sendable {
	public let value: String

	internal init(_ value: String) {
		self.value = value
	}

    // Standard Inputs (Defined in SVGContent Spec)
	public static let sourceGraphic = SVGFilterInput("SourceGraphic")
	public static let sourceAlpha = SVGFilterInput("SourceAlpha")
	public static let backgroundImage = SVGFilterInput("BackgroundImage")
	public static let backgroundAlpha = SVGFilterInput("BackgroundAlpha")
	public static let fillPaint = SVGFilterInput("FillPaint")
	public static let strokePaint = SVGFilterInput("StrokePaint")
}
