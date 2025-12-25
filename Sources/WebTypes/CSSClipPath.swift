#if os(WASI)

import EmbeddedSwiftUtilities

#endif

// <clip-path> = <clip-source> | [ <basic-shape> || <geometry-box> ] | none

// <clip-path> enum
public enum CSSClipPath: Sendable {
	case none(CSSKeyword.None)
	case clipSource(CSSClipSource)
	case basicShape(CSSBasicShape)
	case basicShapeWithBox(CSSBasicShape, CSSGeometryBox)
	case geometryBox(CSSGeometryBox)

	public var value: String {
		switch self {
		case .none(let keyword):
			return keyword.rawValue
		case .clipSource(let source):
			return source.value
		case .basicShape(let shape):
			return shape.value
		case .basicShapeWithBox(let shape, let box):
			return "\(shape.value) \(box.rawValue)"
		case .geometryBox(let box):
			return box.rawValue
		}
	}
}
