public enum CSSAppearance: String {
	public enum CompatAuto: String, Sendable {
		case searchfield = "searchfield"
		case textarea = "textarea"
		case checkbox = "checkbox"
		case radio = "radio"
		case menulist = "menulist"
		case listbox = "listbox"
		case meter = "meter"
		case progressBar = "progress-bar"
		case button = "button"
	}

	public enum CompatSpecial: String, Sendable {
		case textfield = "textfield"
		case menulistButton = "menulist-button"
	}

	case baseSelect = "base-select"
}
