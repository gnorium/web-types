public enum CSSCursor: ExpressibleByStringLiteral, Sendable {
    public typealias StringLiteralType = StaticString
	case auto(CSSKeyword.Auto)
	case `default`
	case pointer
	case text
	case move
	case notAllowed
	case grab
	case grabbing
	case crosshair
	case help
	case wait
	case progress
	case noDrop
	case copy
	case alias
	case contextMenu
	case cell
	case verticalText
	case allScroll
	case colResize
	case rowResize
	case nResize
	case eResize
	case sResize
	case wResize
	case neResize
	case nwResize
	case seResize
	case swResize
	case ewResize
	case nsResize
	case neswResize
	case nwseResize
	case zoomIn
	case zoomOut
	case customIdent(String)
    case customIdentStatic(StaticString)

	public init(stringLiteral value: StaticString) {
		self = .customIdentStatic(value)
	}

    public var staticValue: StaticString? {
        switch self {
        case .auto(let keyword): return keyword.staticRawValue
        case .default: return "default"
        case .pointer: return "pointer"
        case .text: return "text"
        case .move: return "move"
        case .notAllowed: return "not-allowed"
        case .grab: return "grab"
        case .grabbing: return "grabbing"
        case .crosshair: return "crosshair"
        case .help: return "help"
        case .wait: return "wait"
        case .progress: return "progress"
        case .noDrop: return "no-drop"
        case .copy: return "copy"
        case .alias: return "alias"
        case .contextMenu: return "context-menu"
        case .cell: return "cell"
        case .verticalText: return "vertical-text"
        case .allScroll: return "all-scroll"
        case .colResize: return "col-resize"
        case .rowResize: return "row-resize"
        case .nResize: return "n-resize"
        case .eResize: return "e-resize"
        case .sResize: return "s-resize"
        case .wResize: return "w-resize"
        case .neResize: return "ne-resize"
        case .nwResize: return "nw-resize"
        case .seResize: return "se-resize"
        case .swResize: return "sw-resize"
        case .ewResize: return "ew-resize"
        case .nsResize: return "ns-resize"
        case .neswResize: return "nesw-resize"
        case .nwseResize: return "nwse-resize"
        case .zoomIn: return "zoom-in"
        case .zoomOut: return "zoom-out"
        case .customIdent: return nil // Dynamic string
        case .customIdentStatic(let ident): return ident
        }
    }

	public var value: String {
		switch self {
		case .auto(let keyword): return keyword.rawValue
		case .default: return "default"
		case .pointer: return "pointer"
		case .text: return "text"
		case .move: return "move"
		case .notAllowed: return "not-allowed"
		case .grab: return "grab"
		case .grabbing: return "grabbing"
		case .crosshair: return "crosshair"
		case .help: return "help"
		case .wait: return "wait"
		case .progress: return "progress"
		case .noDrop: return "no-drop"
		case .copy: return "copy"
		case .alias: return "alias"
		case .contextMenu: return "context-menu"
		case .cell: return "cell"
		case .verticalText: return "vertical-text"
		case .allScroll: return "all-scroll"
		case .colResize: return "col-resize"
		case .rowResize: return "row-resize"
		case .nResize: return "n-resize"
		case .eResize: return "e-resize"
		case .sResize: return "s-resize"
		case .wResize: return "w-resize"
		case .neResize: return "ne-resize"
		case .nwResize: return "nw-resize"
		case .seResize: return "se-resize"
		case .swResize: return "sw-resize"
		case .ewResize: return "ew-resize"
		case .nsResize: return "ns-resize"
		case .neswResize: return "nesw-resize"
		case .nwseResize: return "nwse-resize"
		case .zoomIn: return "zoom-in"
		case .zoomOut: return "zoom-out"
		case .customIdent(let ident): return ident
        case .customIdentStatic(let ident): return ident.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
		}
	}

	public static var auto: CSSCursor {
		.auto(.auto)
	}
}
