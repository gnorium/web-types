public enum ARIARole: Sendable {
	// Widget roles
	case button
	case checkbox
	case gridcell
	case link
	case menuitem
	case menuitemcheckbox
	case menuitemradio
	case option
	case progressbar
	case radio
	case scrollbar
	case searchbox
	case separator
	case slider
	case spinbutton
	case `switch`
	case tab
	case tabpanel
	case textbox
	case treeitem

	// Composite widget roles
	case combobox
	case grid
	case listbox
	case menu
	case menubar
	case radiogroup
	case tablist
	case tree
	case treegrid

	// Document structure roles
	case application
	case article
	case cell
	case columnheader
	case definition
	case directory
	case document
	case feed
	case figure
	case group
	case heading
	case img
	case list
	case listitem
	case math
	case none(CSSKeyword.None)

	@_disfavoredOverload
	public static var none: Self { .none(.none) }

	case note
	case presentation
	case row
	case rowgroup
	case rowheader
	case table
	case term
	case toolbar
	case tooltip

	// Landmark roles
	case banner
	case complementary
	case contentinfo
	case form
	case main
	case navigation
	case region
	case search

	// Live region roles
	case alert
	case log
	case marquee
	case status
	case timer

	// Window roles
	case alertdialog
	case dialog

    public var rawValue: String {
        switch self {
        case .button: return "button"
        case .checkbox: return "checkbox"
        case .gridcell: return "gridcell"
        case .link: return "link"
        case .menuitem: return "menuitem"
        case .menuitemcheckbox: return "menuitemcheckbox"
        case .menuitemradio: return "menuitemradio"
        case .option: return "option"
        case .progressbar: return "progressbar"
        case .radio: return "radio"
        case .scrollbar: return "scrollbar"
        case .searchbox: return "searchbox"
        case .separator: return "separator"
        case .slider: return "slider"
        case .spinbutton: return "spinbutton"
        case .switch: return "switch"
        case .tab: return "tab"
        case .tabpanel: return "tabpanel"
        case .textbox: return "textbox"
        case .treeitem: return "treeitem"
        case .combobox: return "combobox"
        case .grid: return "grid"
        case .listbox: return "listbox"
        case .menu: return "menu"
        case .menubar: return "menubar"
        case .radiogroup: return "radiogroup"
        case .tablist: return "tablist"
        case .tree: return "tree"
        case .treegrid: return "treegrid"
        case .application: return "application"
        case .article: return "article"
        case .cell: return "cell"
        case .columnheader: return "columnheader"
        case .definition: return "definition"
        case .directory: return "directory"
        case .document: return "document"
        case .feed: return "feed"
        case .figure: return "figure"
        case .group: return "group"
        case .heading: return "heading"
        case .img: return "img"
        case .list: return "list"
        case .listitem: return "listitem"
        case .math: return "math"
        case .none(let keyword): return keyword.rawValue
        case .note: return "note"
        case .presentation: return "presentation"
        case .row: return "row"
        case .rowgroup: return "rowgroup"
        case .rowheader: return "rowheader"
        case .table: return "table"
        case .term: return "term"
        case .toolbar: return "toolbar"
        case .tooltip: return "tooltip"
        case .banner: return "banner"
        case .complementary: return "complementary"
        case .contentinfo: return "contentinfo"
        case .form: return "form"
        case .main: return "main"
        case .navigation: return "navigation"
        case .region: return "region"
        case .search: return "search"
        case .alert: return "alert"
        case .log: return "log"
        case .marquee: return "marquee"
        case .status: return "status"
        case .timer: return "timer"
        case .alertdialog: return "alertdialog"
        case .dialog: return "dialog"
        }
    }
}
