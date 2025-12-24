public enum CSSDisplay: Sendable {
	case outside(Outside)
	case inside(Inside)
	case listItem(ListItem)
	case `internal`(Internal)
	case box(Box)
	case legacy(Legacy)
	case none

	public var rawValue: String {
		switch self {
			case .outside(let value): return value.rawValue
			case .inside(let value): return value.rawValue
			case .listItem(let value): return value.rawValue
			case .internal(let value): return value.rawValue
			case .box(let value): return value.rawValue
			case .legacy(let value): return value.rawValue
			case .none: return "none"
		}
	}

	public var staticRawValue: StaticString {
		switch self {
			case .outside(let value): return value.staticRawValue
			case .inside(let value): return value.staticRawValue
			case .listItem(let value): return value.staticRawValue
			case .internal(let value): return value.staticRawValue
			case .box(let value): return value.staticRawValue
			case .legacy(let value): return value.staticRawValue
			case .none: return "none"
		}
	}

	// Static members for common values
	public static let block: CSSDisplay = .outside(.block)
	public static let inline: CSSDisplay = .outside(.inline)
	public static let flex: CSSDisplay = .inside(.flex)
	public static let grid: CSSDisplay = .inside(.grid)
	public static let inlineBlock: CSSDisplay = .legacy(.inlineBlock)
	public static let inlineFlex: CSSDisplay = .legacy(.inlineFlex)
	
	public enum Outside: Sendable {
		case block
		case inline

		public var rawValue: String {
			switch self {
				case .block: return "block"
				case .inline: return "inline"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .block: return "block"
				case .inline: return "inline"
			}
		}
	}

	public enum Inside: Sendable {
		case flow
		case flowRoot
		case table
		case flex
		case grid
		case ruby

		public var rawValue: String {
			switch self {
				case .flow: return "flow"
				case .flowRoot: return "flow-root"
				case .table: return "table"
				case .flex: return "flex"
				case .grid: return "grid"
				case .ruby: return "ruby"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .flow: return "flow"
				case .flowRoot: return "flow-root"
				case .table: return "table"
				case .flex: return "flex"
				case .grid: return "grid"
				case .ruby: return "ruby"
			}
		}
	}

	public enum ListItem: Sendable {
		case listItem

		public var rawValue: String {
			switch self {
				case .listItem: return "list-item"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .listItem: return "list-item"
			}
		}
	}

	public enum Internal: Sendable {
		case tableRowGroup
		case tableHeaderGroup
		case tableFooterGroup
		case tableRow
		case tableCell
		case tableColumnGroup
		case tableColumn
		case tableCaption
		case rubyBase
		case rubyText
		case rubyBaseContainer
		case rubyTextContainer

		public var rawValue: String {
			switch self {
				case .tableRowGroup: return "table-row-group"
				case .tableHeaderGroup: return "table-header-group"
				case .tableFooterGroup: return "table-footer-group"
				case .tableRow: return "table-row"
				case .tableCell: return "table-cell"
				case .tableColumnGroup: return "table-column-group"
				case .tableColumn: return "table-column"
				case .tableCaption: return "table-caption"
				case .rubyBase: return "ruby-base"
				case .rubyText: return "ruby-text"
				case .rubyBaseContainer: return "ruby-base-container"
				case .rubyTextContainer: return "ruby-text-container"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .tableRowGroup: return "table-row-group"
				case .tableHeaderGroup: return "table-header-group"
				case .tableFooterGroup: return "table-footer-group"
				case .tableRow: return "table-row"
				case .tableCell: return "table-cell"
				case .tableColumnGroup: return "table-column-group"
				case .tableColumn: return "table-column"
				case .tableCaption: return "table-caption"
				case .rubyBase: return "ruby-base"
				case .rubyText: return "ruby-text"
				case .rubyBaseContainer: return "ruby-base-container"
				case .rubyTextContainer: return "ruby-text-container"
			}
		}
	}

	public enum Box: Sendable {
		case contents

		public var rawValue: String {
			switch self {
				case .contents: return "contents"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .contents: return "contents"
			}
		}
	}

	public enum Legacy: Sendable {
		case inlineBlock
		case inlineTable
		case inlineFlex
		case inlineGrid

		public var rawValue: String {
			switch self {
				case .inlineBlock: return "inline-block"
				case .inlineTable: return "inline-table"
				case .inlineFlex: return "inline-flex"
				case .inlineGrid: return "inline-grid"
			}
		}

		public var staticRawValue: StaticString {
			switch self {
				case .inlineBlock: return "inline-block"
				case .inlineTable: return "inline-table"
				case .inlineFlex: return "inline-flex"
				case .inlineGrid: return "inline-grid"
			}
		}
	}
}
