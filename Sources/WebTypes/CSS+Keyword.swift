import EmbeddedSwiftUtilities

#if SERVER
  extension CSS {
    public enum Keyword {
    /// The "none" keyword
    public enum None: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case none = "none"

      public var staticRawValue: StaticString {
        return "none"
      }
    }

    /// The "auto" keyword
    public enum Auto: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case auto = "auto"

      public var staticRawValue: StaticString {
        return "auto"
      }
    }

    public enum All: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case all = "all"

      public var staticRawValue: StaticString {
        "all"
      }
    }

    /// The "infinite" keyword
    public enum Infinite: String, Sendable {
      case infinite = "infinite"
    }

    /// Length keywords
    public enum Length: String, Sendable, CustomStringConvertible {
      public var description: String { rawValue }
      case maxContent = "max-content"
      case minContent = "min-content"
      case fitContent = "fit-content"
      case stretch = "stretch"

      public var staticRawValue: StaticString {
        switch self {
        case .maxContent: return "max-content"
        case .minContent: return "min-content"
        case .fitContent: return "fit-content"
        case .stretch: return "stretch"
        }
      }
    }

    public enum Global: String, CustomStringConvertible, Sendable {
      case inherit = "inherit"
      case initial = "initial"
      case revert = "revert"
      case revertLayer = "revert-layer"
      case unset = "unset"

      public var description: String {
        rawValue
      }

      public var staticRawValue: StaticString {
        switch self {
        case .inherit: return "inherit"
        case .initial: return "initial"
        case .revert: return "revert"
        case .revertLayer: return "revert-layer"
        case .unset: return "unset"
        }
      }
    }

    public enum Inherit: String, Sendable {
      case inherit = "inherit"
      public var staticRawValue: StaticString { "inherit" }
    }

    public enum Initial: String, Sendable {
      case initial = "initial"
      public var staticRawValue: StaticString { "initial" }
    }

    public enum Revert: String, Sendable {
      case revert = "revert"
      public var staticRawValue: StaticString { "revert" }
    }

    public enum RevertLayer: String, Sendable {
      case revertLayer = "revert-layer"
      public var staticRawValue: StaticString { "revert-layer" }
    }

    public enum Unset: String, Sendable {
      case unset = "unset"
      public var staticRawValue: StaticString { "unset" }
    }

    public enum Visibility: String, Sendable {
      case visible = "visible"
      case hidden = "hidden"
      case collapse = "collapse"
    }

    public enum CurrentColor: String, Sendable {
      case currentColor = "currentColor"
    }

    public enum Transparent: String, Sendable {
      case transparent = "transparent"
    }
    }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  extension CSS {
    public enum Keyword {
      /// The "none" keyword
      public enum None: Sendable, RawRepresentable, CustomStringConvertible {
        public var description: String { rawValue }
        case none
        public var rawValue: String { "none" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "none") { self = .none } else { return nil }
        }
        public var staticRawValue: StaticString { "none" }
      }

      /// The "auto" keyword
      public enum Auto: Sendable, RawRepresentable, CustomStringConvertible {
        public var description: String { rawValue }
        case auto
        public var rawValue: String { "auto" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "auto") { self = .auto } else { return nil }
        }
        public var staticRawValue: StaticString { "auto" }
      }

      public enum All: Sendable, RawRepresentable, CustomStringConvertible {
        public var description: String { rawValue }
        case all
        public var rawValue: String { "all" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "all") { self = .all } else { return nil }
        }
        public var staticRawValue: StaticString { "all" }
      }

      /// The "infinite" keyword
      public enum Infinite: Sendable, RawRepresentable {
        case infinite
        public var rawValue: String { "infinite" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "infinite") { self = .infinite } else { return nil }
        }
      }

      /// Length keywords
      public enum Length: Sendable, RawRepresentable, CustomStringConvertible {
        public var description: String { rawValue }
        case maxContent
        case minContent
        case fitContent
        case stretch
        public var rawValue: String {
          switch self {
          case .maxContent: return "max-content"
          case .minContent: return "min-content"
          case .fitContent: return "fit-content"
          case .stretch: return "stretch"
          }
        }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "max-content") {
            self = .maxContent
          } else if stringEquals(rawValue, "min-content") {
            self = .minContent
          } else if stringEquals(rawValue, "fit-content") {
            self = .fitContent
          } else if stringEquals(rawValue, "stretch") {
            self = .stretch
          } else {
            return nil
          }
        }
        public var staticRawValue: StaticString {
          switch self {
          case .maxContent: return "max-content"
          case .minContent: return "min-content"
          case .fitContent: return "fit-content"
          case .stretch: return "stretch"
          }
        }
      }

      public enum Global: Sendable, RawRepresentable {
        case inherit
        case initial
        case revert
        case revertLayer
        case unset

        public var description: String { rawValue }

        public var rawValue: String {
          switch self {
          case .inherit: return "inherit"
          case .initial: return "initial"
          case .revert: return "revert"
          case .revertLayer: return "revert-layer"
          case .unset: return "unset"
          }
        }

        public init?(rawValue: String) {
          if stringEquals(rawValue, "inherit") {
            self = .inherit
          } else if stringEquals(rawValue, "initial") {
            self = .initial
          } else if stringEquals(rawValue, "revert") {
            self = .revert
          } else if stringEquals(rawValue, "revert-layer") {
            self = .revertLayer
          } else if stringEquals(rawValue, "unset") {
            self = .unset
          } else {
            return nil
          }
        }

        public var staticRawValue: StaticString {
          switch self {
          case .inherit: return "inherit"
          case .initial: return "initial"
          case .revert: return "revert"
          case .revertLayer: return "revert-layer"
          case .unset: return "unset"
          }
        }
      }

      public enum Inherit: Sendable, RawRepresentable {
        case inherit
        public var rawValue: String { "inherit" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "inherit") { self = .inherit } else { return nil }
        }
        public var staticRawValue: StaticString { "inherit" }
      }

      public enum Initial: Sendable, RawRepresentable {
        case initial
        public var rawValue: String { "initial" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "initial") { self = .initial } else { return nil }
        }
        public var staticRawValue: StaticString { "initial" }
      }

      public enum Revert: Sendable, RawRepresentable {
        case revert
        public var rawValue: String { "revert" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "revert") { self = .revert } else { return nil }
        }
        public var staticRawValue: StaticString { "revert" }
      }

      public enum RevertLayer: Sendable, RawRepresentable {
        case revertLayer
        public var rawValue: String { "revert-layer" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "revert-layer") { self = .revertLayer } else { return nil }
        }
        public var staticRawValue: StaticString { "revert-layer" }
      }

      public enum Unset: Sendable, RawRepresentable {
        case unset
        public var rawValue: String { "unset" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "unset") { self = .unset } else { return nil }
        }
        public var staticRawValue: StaticString { "unset" }
      }

      public enum Visibility: Sendable, RawRepresentable {
        case visible
        case hidden
        case collapse
        public var rawValue: String {
          switch self {
          case .visible: return "visible"
          case .hidden: return "hidden"
          case .collapse: return "collapse"
          }
        }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "visible") {
            self = .visible
          } else if stringEquals(rawValue, "hidden") {
            self = .hidden
          } else if stringEquals(rawValue, "collapse") {
            self = .collapse
          } else {
            return nil
          }
        }
      }

      public enum CurrentColor: Sendable, RawRepresentable {
        case currentColor
        public var rawValue: String { "currentColor" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "currentColor") { self = .currentColor } else { return nil }
        }
      }

      public enum Transparent: Sendable, RawRepresentable {
        case transparent
        public var rawValue: String { "transparent" }
        public init?(rawValue: String) {
          if stringEquals(rawValue, "transparent") { self = .transparent } else { return nil }
        }
      }
    }
  }
#endif
