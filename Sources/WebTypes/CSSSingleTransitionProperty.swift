// <single-transition-property> = all | <custom-ident>
// Note: 'none' is part of the [ none | <single-transition-property> ] group
public enum CSSSingleTransitionProperty: ExpressibleByStringLiteral, Sendable {
	case all(CSSKeyword.All)
	case customIdent(String) // For any CSSProtocol property name
	// Common CSSProtocol properties
	case color
	case backgroundColor
	case opacity
	case transform
	case width
	case height
	case maxHeight
	case top
	case left
	case right
	case bottom
	case margin
	case padding
	case border
	case borderColor
	case borderWidth
	case boxShadow
	case fontSize
	case lineHeight
	case fill
	case stroke
	case strokeWidth
	case filter

	public init(_ string: String) {
		self = .customIdent(string)
	}

	public init(stringLiteral value: String) {
		self = .customIdent(value)
	}

	public var value: String {
		switch self {
		case .all(let keyword):
			return keyword.rawValue
		case .customIdent(let ident):
			return ident
		case .color:
			return "color"
		case .backgroundColor:
			return "background-color"
		case .opacity:
			return "opacity"
		case .transform:
			return "transform"
		case .width:
			return "width"
		case .height:
			return "height"
		case .maxHeight:
			return "max-height"
		case .top:
			return "top"
		case .left:
			return "left"
		case .right:
			return "right"
		case .bottom:
			return "bottom"
		case .margin:
			return "margin"
		case .padding:
			return "padding"
		case .border:
			return "border"
		case .borderColor:
			return "border-color"
		case .borderWidth:
			return "border-width"
		case .boxShadow:
			return "box-shadow"
		case .fontSize:
			return "font-size"
		case .lineHeight:
			return "line-height"
		case .fill:
			return "fill"
		case .stroke:
			return "stroke"
		case .strokeWidth:
			return "stroke-width"
		case .filter:
			return "filter"
		}
	}

    public var staticValue: StaticString? {
        switch self {
        case .all(let keyword): return keyword.staticRawValue
        case .customIdent: return nil
        case .color: return "color"
        case .backgroundColor: return "background-color"
        case .opacity: return "opacity"
        case .transform: return "transform"
        case .width: return "width"
        case .height: return "height"
        case .maxHeight: return "max-height"
        case .top: return "top"
        case .left: return "left"
        case .right: return "right"
        case .bottom: return "bottom"
        case .margin: return "margin"
        case .padding: return "padding"
        case .border: return "border"
        case .borderColor: return "border-color"
        case .borderWidth: return "border-width"
        case .boxShadow: return "box-shadow"
        case .fontSize: return "font-size"
        case .lineHeight: return "line-height"
        case .fill: return "fill"
        case .stroke: return "stroke"
        case .strokeWidth: return "stroke-width"
        case .filter: return "filter"
        }
    }
}

// MARK: - Static Properties
public extension CSSSingleTransitionProperty {
	static var all: CSSSingleTransitionProperty { .all(.all) }
}
