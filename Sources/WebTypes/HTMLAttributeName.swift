#if SERVER
  public enum HTMLAttributeName: String, Sendable {
    case ariaDisabled = "aria-disabled"
    case ariaPressed = "aria-pressed"
    case ariaSelected = "aria-selected"
    case ariaExpanded = "aria-expanded"
    case ariaHidden = "aria-hidden"
    case ariaLabel = "aria-label"
    case ariaLabelledBy = "aria-labelledby"
    case ariaDescribedBy = "aria-describedby"
    case ariaMultiselectable = "aria-multiselectable"
    case ariaLive = "aria-live"
    case textContent = "textContent"
    case indeterminate = "indeterminate"
    case style = "style"
    case `class` = "class"
    case id = "id"
    case scope = "scope"
    case href = "href"
    case src = "src"
    case alt = "alt"
    case title = "title"
    case placeholder = "placeholder"
    case value = "value"
    case disabled = "disabled"
    case checked = "checked"
    case selected = "selected"
    case hidden = "hidden"
    case open = "open"
    case tabindex = "tabindex"
    case name = "name"
    case action = "action"
    case `for` = "for"
    case type = "type"
    case role = "role"
    case rows = "rows"
    case cols = "cols"
    case step = "step"
    case min = "min"
    case max = "max"
    case readonly = "readonly"
    case required = "required"
    case autocomplete = "autocomplete"
    case autocapitalize = "autocapitalize"
    case autocorrect = "autocorrect"
    case spellcheck = "spellcheck"
    case draggable = "draggable"

    // Nested marker enums for type-safe value resolution

    /// Marker for `type` attribute - only accepts HTMLButton.Type values
    public enum `Type`: Sendable {
      case type
    }

    /// Marker for `role` attribute - only accepts ARIARole values
    public enum Role: Sendable {
      case role
    }

    /// Marker for `aria-live` attribute - only accepts ARIALive values
    public enum AriaLive: Sendable {
      case ariaLive
    }
  }
#endif

#if CLIENT
  import EmbeddedSwiftUtilities

  public enum HTMLAttributeName: Sendable, RawRepresentable {
    case ariaDisabled
    case ariaPressed
    case ariaSelected
    case ariaExpanded
    case ariaHidden
    case ariaLabel
    case ariaLabelledBy
    case ariaDescribedBy
    case ariaMultiselectable
    case ariaLive
    case textContent
    case indeterminate
    case style
    case `class`
    case id
    case scope
    case href
    case src
    case alt
    case title
    case placeholder
    case value
    case disabled
    case checked
    case selected
    case hidden
    case open
    case tabindex
    case name
    case action
    case `for`
    case type
    case role
    case rows
    case cols
    case step
    case min
    case max
    case readonly
    case required
    case autocomplete
    case autocapitalize
    case autocorrect
    case spellcheck
    case draggable

    public var rawValue: String {
      switch self {
      case .ariaDisabled: return "aria-disabled"
      case .ariaPressed: return "aria-pressed"
      case .ariaSelected: return "aria-selected"
      case .ariaExpanded: return "aria-expanded"
      case .ariaHidden: return "aria-hidden"
      case .ariaLabel: return "aria-label"
      case .ariaLabelledBy: return "aria-labelledby"
      case .ariaDescribedBy: return "aria-describedby"
      case .ariaMultiselectable: return "aria-multiselectable"
      case .ariaLive: return "aria-live"
      case .textContent: return "textContent"
      case .indeterminate: return "indeterminate"
      case .style: return "style"
      case .class: return "class"
      case .id: return "id"
      case .scope: return "scope"
      case .href: return "href"
      case .src: return "src"
      case .alt: return "alt"
      case .title: return "title"
      case .placeholder: return "placeholder"
      case .value: return "value"
      case .disabled: return "disabled"
      case .checked: return "checked"
      case .selected: return "selected"
      case .hidden: return "hidden"
      case .open: return "open"
      case .tabindex: return "tabindex"
      case .name: return "name"
      case .action: return "action"
      case .for: return "for"
      case .type: return "type"
      case .role: return "role"
      case .rows: return "rows"
      case .cols: return "cols"
      case .step: return "step"
      case .min: return "min"
      case .max: return "max"
      case .readonly: return "readonly"
      case .required: return "required"
      case .autocomplete: return "autocomplete"
      case .autocapitalize: return "autocapitalize"
      case .autocorrect: return "autocorrect"
      case .spellcheck: return "spellcheck"
      case .draggable: return "draggable"
      }
    }

    public init?(rawValue: String) {
      if stringEquals(rawValue, "aria-disabled") {
        self = .ariaDisabled
      } else if stringEquals(rawValue, "aria-pressed") {
        self = .ariaPressed
      } else if stringEquals(rawValue, "aria-selected") {
        self = .ariaSelected
      } else if stringEquals(rawValue, "aria-expanded") {
        self = .ariaExpanded
      } else if stringEquals(rawValue, "aria-hidden") {
        self = .ariaHidden
      } else if stringEquals(rawValue, "aria-label") {
        self = .ariaLabel
      } else if stringEquals(rawValue, "aria-labelledby") {
        self = .ariaLabelledBy
      } else if stringEquals(rawValue, "aria-describedby") {
        self = .ariaDescribedBy
      } else if stringEquals(rawValue, "aria-multiselectable") {
        self = .ariaMultiselectable
      } else if stringEquals(rawValue, "aria-live") {
        self = .ariaLive
      } else if stringEquals(rawValue, "textContent") {
        self = .textContent
      } else if stringEquals(rawValue, "indeterminate") {
        self = .indeterminate
      } else if stringEquals(rawValue, "style") {
        self = .style
      } else if stringEquals(rawValue, "class") {
        self = .class
      } else if stringEquals(rawValue, "id") {
        self = .id
      } else if stringEquals(rawValue, "scope") {
        self = .scope
      } else if stringEquals(rawValue, "href") {
        self = .href
      } else if stringEquals(rawValue, "src") {
        self = .src
      } else if stringEquals(rawValue, "alt") {
        self = .alt
      } else if stringEquals(rawValue, "title") {
        self = .title
      } else if stringEquals(rawValue, "placeholder") {
        self = .placeholder
      } else if stringEquals(rawValue, "value") {
        self = .value
      } else if stringEquals(rawValue, "disabled") {
        self = .disabled
      } else if stringEquals(rawValue, "checked") {
        self = .checked
      } else if stringEquals(rawValue, "selected") {
        self = .selected
      } else if stringEquals(rawValue, "hidden") {
        self = .hidden
      } else if stringEquals(rawValue, "open") {
        self = .open
      } else if stringEquals(rawValue, "tabindex") {
        self = .tabindex
      } else if stringEquals(rawValue, "name") {
        self = .name
      } else if stringEquals(rawValue, "action") {
        self = .action
      } else if stringEquals(rawValue, "for") {
        self = .for
      } else if stringEquals(rawValue, "type") {
        self = .type
      } else if stringEquals(rawValue, "role") {
        self = .role
      } else if stringEquals(rawValue, "rows") {
        self = .rows
      } else if stringEquals(rawValue, "cols") {
        self = .cols
      } else if stringEquals(rawValue, "step") {
        self = .step
      } else if stringEquals(rawValue, "min") {
        self = .min
      } else if stringEquals(rawValue, "max") {
        self = .max
      } else if stringEquals(rawValue, "readonly") {
        self = .readonly
      } else if stringEquals(rawValue, "required") {
        self = .required
      } else if stringEquals(rawValue, "autocomplete") {
        self = .autocomplete
      } else if stringEquals(rawValue, "autocapitalize") {
        self = .autocapitalize
      } else if stringEquals(rawValue, "autocorrect") {
        self = .autocorrect
      } else if stringEquals(rawValue, "spellcheck") {
        self = .spellcheck
      } else if stringEquals(rawValue, "draggable") {
        self = .draggable
      } else {
        return nil
      }
    }

    // Nested marker enums for type-safe value resolution

    /// Marker for `type` attribute - only accepts HTMLButton.Type values
    public enum `Type`: Sendable {
      case type
    }

    /// Marker for `role` attribute - only accepts ARIARole values
    public enum Role: Sendable {
      case role
    }

    /// Marker for `aria-live` attribute - only accepts ARIALive values
    public enum AriaLive: Sendable {
      case ariaLive
    }
  }
#endif
