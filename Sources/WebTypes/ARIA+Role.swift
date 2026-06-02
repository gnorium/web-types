import EmbeddedSwiftUtilities

#if SERVER
  extension ARIA {
    public enum Role: String, Sendable {
      // Widget roles
      case button = "button"
      case checkbox = "checkbox"
      case gridcell = "gridcell"
      case link = "link"
      case menuitem = "menuitem"
      case menuitemcheckbox = "menuitemcheckbox"
      case menuitemradio = "menuitemradio"
      case option = "option"
      case progressbar = "progressbar"
      case radio = "radio"
      case scrollbar = "scrollbar"
      case searchbox = "searchbox"
      case separator = "separator"
      case slider = "slider"
      case spinbutton = "spinbutton"
      case `switch` = "switch"
      case tab = "tab"
      case tabpanel = "tabpanel"
      case textbox = "textbox"
      case treeitem = "treeitem"

      // Composite widget roles
      case combobox = "combobox"
      case grid = "grid"
      case listbox = "listbox"
      case menu = "menu"
      case menubar = "menubar"
      case radiogroup = "radiogroup"
      case tablist = "tablist"
      case tree = "tree"
      case treegrid = "treegrid"

      // Document structure roles
      case application = "application"
      case article = "article"
      case cell = "cell"
      case columnheader = "columnheader"
      case definition = "definition"
      case directory = "directory"
      case document = "document"
      case feed = "feed"
      case figure = "figure"
      case group = "group"
      case heading = "heading"
      case img = "img"
      case list = "list"
      case listitem = "listitem"
      case math = "math"

      // Landmark roles
      case banner = "banner"
      case complementary = "complementary"
      case contentinfo = "contentinfo"
      case form = "form"
      case main = "main"
      case navigation = "navigation"
      case region = "region"
      case search = "search"

      // Live region roles
      case alert = "alert"
      case log = "log"
      case marquee = "marquee"
      case status = "status"
      case timer = "timer"

      // Window roles
      case alertdialog = "alertdialog"
      case dialog = "dialog"

      case note = "note"
      case presentation = "presentation"
      case row = "row"
      case rowgroup = "rowgroup"
      case rowheader = "rowheader"
      case table = "table"
      case term = "term"
      case toolbar = "toolbar"
      case tooltip = "tooltip"

      public static var none: CSS.Keyword.None { .none }
    }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  extension ARIA {
    public enum Role: Sendable, RawRepresentable {
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

      case note
      case presentation
      case row
      case rowgroup
      case rowheader
      case table
      case term
      case toolbar
      case tooltip

      public static var none: CSS.Keyword.None { .none }

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

      public init?(rawValue: String) {
        if stringEquals(rawValue, "button") {
          self = .button
        } else if stringEquals(rawValue, "checkbox") {
          self = .checkbox
        } else if stringEquals(rawValue, "gridcell") {
          self = .gridcell
        } else if stringEquals(rawValue, "link") {
          self = .link
        } else if stringEquals(rawValue, "menuitem") {
          self = .menuitem
        } else if stringEquals(rawValue, "menuitemcheckbox") {
          self = .menuitemcheckbox
        } else if stringEquals(rawValue, "menuitemradio") {
          self = .menuitemradio
        } else if stringEquals(rawValue, "option") {
          self = .option
        } else if stringEquals(rawValue, "progressbar") {
          self = .progressbar
        } else if stringEquals(rawValue, "radio") {
          self = .radio
        } else if stringEquals(rawValue, "scrollbar") {
          self = .scrollbar
        } else if stringEquals(rawValue, "searchbox") {
          self = .searchbox
        } else if stringEquals(rawValue, "separator") {
          self = .separator
        } else if stringEquals(rawValue, "slider") {
          self = .slider
        } else if stringEquals(rawValue, "spinbutton") {
          self = .spinbutton
        } else if stringEquals(rawValue, "switch") {
          self = .switch
        } else if stringEquals(rawValue, "tab") {
          self = .tab
        } else if stringEquals(rawValue, "tabpanel") {
          self = .tabpanel
        } else if stringEquals(rawValue, "textbox") {
          self = .textbox
        } else if stringEquals(rawValue, "treeitem") {
          self = .treeitem
        } else if stringEquals(rawValue, "combobox") {
          self = .combobox
        } else if stringEquals(rawValue, "grid") {
          self = .grid
        } else if stringEquals(rawValue, "listbox") {
          self = .listbox
        } else if stringEquals(rawValue, "menu") {
          self = .menu
        } else if stringEquals(rawValue, "menubar") {
          self = .menubar
        } else if stringEquals(rawValue, "radiogroup") {
          self = .radiogroup
        } else if stringEquals(rawValue, "tablist") {
          self = .tablist
        } else if stringEquals(rawValue, "tree") {
          self = .tree
        } else if stringEquals(rawValue, "treegrid") {
          self = .treegrid
        } else if stringEquals(rawValue, "application") {
          self = .application
        } else if stringEquals(rawValue, "article") {
          self = .article
        } else if stringEquals(rawValue, "cell") {
          self = .cell
        } else if stringEquals(rawValue, "columnheader") {
          self = .columnheader
        } else if stringEquals(rawValue, "definition") {
          self = .definition
        } else if stringEquals(rawValue, "directory") {
          self = .directory
        } else if stringEquals(rawValue, "document") {
          self = .document
        } else if stringEquals(rawValue, "feed") {
          self = .feed
        } else if stringEquals(rawValue, "figure") {
          self = .figure
        } else if stringEquals(rawValue, "group") {
          self = .group
        } else if stringEquals(rawValue, "heading") {
          self = .heading
        } else if stringEquals(rawValue, "img") {
          self = .img
        } else if stringEquals(rawValue, "list") {
          self = .list
        } else if stringEquals(rawValue, "listitem") {
          self = .listitem
        } else if stringEquals(rawValue, "math") {
          self = .math
        } else if stringEquals(rawValue, "note") {
          self = .note
        } else if stringEquals(rawValue, "presentation") {
          self = .presentation
        } else if stringEquals(rawValue, "row") {
          self = .row
        } else if stringEquals(rawValue, "rowgroup") {
          self = .rowgroup
        } else if stringEquals(rawValue, "rowheader") {
          self = .rowheader
        } else if stringEquals(rawValue, "table") {
          self = .table
        } else if stringEquals(rawValue, "term") {
          self = .term
        } else if stringEquals(rawValue, "toolbar") {
          self = .toolbar
        } else if stringEquals(rawValue, "tooltip") {
          self = .tooltip
        } else if stringEquals(rawValue, "banner") {
          self = .banner
        } else if stringEquals(rawValue, "complementary") {
          self = .complementary
        } else if stringEquals(rawValue, "contentinfo") {
          self = .contentinfo
        } else if stringEquals(rawValue, "form") {
          self = .form
        } else if stringEquals(rawValue, "main") {
          self = .main
        } else if stringEquals(rawValue, "navigation") {
          self = .navigation
        } else if stringEquals(rawValue, "region") {
          self = .region
        } else if stringEquals(rawValue, "search") {
          self = .search
        } else if stringEquals(rawValue, "alert") {
          self = .alert
        } else if stringEquals(rawValue, "log") {
          self = .log
        } else if stringEquals(rawValue, "marquee") {
          self = .marquee
        } else if stringEquals(rawValue, "status") {
          self = .status
        } else if stringEquals(rawValue, "timer") {
          self = .timer
        } else if stringEquals(rawValue, "alertdialog") {
          self = .alertdialog
        } else if stringEquals(rawValue, "dialog") {
          self = .dialog
        } else {
          return nil
        }
      }
    }
  }
#endif
