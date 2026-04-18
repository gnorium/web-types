#if os(WASI)

import EmbeddedSwiftUtilities

#endif

public enum CSSCursor: Sendable, CSSVariableConvertible {
	case auto(CSSKeyword.Auto)
	case `default`
	case none(CSSKeyword.None)
	case contextMenu
	case help
	case pointer
	case progress
	case wait
	case cell
	case crosshair
	case text
	case verticalText
	case alias
	case copy
	case move
	case noDrop
	case notAllowed
	case grab
	case grabbing
	case eResize
	case nResize
	case neResize
	case nwResize
	case sResize
	case seResize
	case swResize
	case wResize
	case ewResize
	case nsResize
	case neswResize
	case nwseResize
	case colResize
	case rowResize
	case allScroll
	case zoomIn
	case zoomOut
	case variable(String)

	@_disfavoredOverload
	public static var auto: CSSCursor { .auto(.auto) }
	@_disfavoredOverload
	public static var none: CSSCursor { .none(.none) }

	public var value: String {
		switch self {
		case .auto(let keyword): return keyword.rawValue
		case .default: return "default"
		case .none(let keyword): return keyword.rawValue
		case .contextMenu: return "context-menu"
		case .help: return "help"
		case .pointer: return "pointer"
		case .progress: return "progress"
		case .wait: return "wait"
		case .cell: return "cell"
		case .crosshair: return "crosshair"
		case .text: return "text"
		case .verticalText: return "vertical-text"
		case .alias: return "alias"
		case .copy: return "copy"
		case .move: return "move"
		case .noDrop: return "no-drop"
		case .notAllowed: return "not-allowed"
		case .grab: return "grab"
		case .grabbing: return "grabbing"
		case .eResize: return "e-resize"
		case .nResize: return "n-resize"
		case .neResize: return "ne-resize"
		case .nwResize: return "nw-resize"
		case .sResize: return "s-resize"
		case .seResize: return "se-resize"
		case .swResize: return "sw-resize"
		case .wResize: return "w-resize"
		case .ewResize: return "ew-resize"
		case .nsResize: return "ns-resize"
		case .neswResize: return "nesw-resize"
		case .nwseResize: return "nwse-resize"
		case .colResize: return "col-resize"
		case .rowResize: return "row-resize"
		case .allScroll: return "all-scroll"
		case .zoomIn: return "zoom-in"
		case .zoomOut: return "zoom-out"
		case .variable(let name): return concat("var(", name, ")")
		}
	}

	public var staticRawValue: StaticString? {
		switch self {
		case .auto: return "auto"
		case .default: return "default"
		case .none: return "none"
		case .contextMenu: return "context-menu"
		case .help: return "help"
		case .pointer: return "pointer"
		case .progress: return "progress"
		case .wait: return "wait"
		case .cell: return "cell"
		case .crosshair: return "crosshair"
		case .text: return "text"
		case .verticalText: return "vertical-text"
		case .alias: return "alias"
		case .copy: return "copy"
		case .move: return "move"
		case .noDrop: return "no-drop"
		case .notAllowed: return "not-allowed"
		case .grab: return "grab"
		case .grabbing: return "grabbing"
		case .eResize: return "e-resize"
		case .nResize: return "n-resize"
		case .neResize: return "ne-resize"
		case .nwResize: return "nw-resize"
		case .sResize: return "s-resize"
		case .seResize: return "se-resize"
		case .swResize: return "sw-resize"
		case .wResize: return "w-resize"
		case .ewResize: return "ew-resize"
		case .nsResize: return "ns-resize"
		case .neswResize: return "nesw-resize"
		case .nwseResize: return "nwse-resize"
		case .colResize: return "col-resize"
		case .rowResize: return "row-resize"
		case .allScroll: return "all-scroll"
		case .zoomIn: return "zoom-in"
		case .zoomOut: return "zoom-out"
		case .variable: return nil
		}
	}
}
