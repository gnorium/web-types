#if !os(WASI)

import Foundation

/// SVG shape-rendering attribute values
/// Controls how shapes are rendered by the browser
/// https://www.w3.org/TR/SVG2/painting.html#ShapeRenderingProperty
public enum SVGShapeRendering: String, Sendable {
	/// Use optimized rendering for speed
	case optimizeSpeed = "optimizeSpeed"
	
	/// Use crisp edges without anti-aliasing (best for eliminating seams)
	case crispEdges = "crispEdges"
	
	/// Use geometric precision
	case geometricPrecision = "geometricPrecision"
}

#endif
