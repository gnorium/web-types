public enum TagName {
	case span, li, ul, div, a, button, input, form, hr, style
	case h1, h2, h3, h4, h5, h6, p, img
	case section, article, nav, header, footer, main, aside
	case details, summary, canvas, video, audio
	case table, thead, tbody, tr, th, td
	case label, select, option, textarea
	case strong, b

	public var value: StaticString {
		switch self {
		case .span: return "span"
		case .li: return "li"
		case .ul: return "ul"
		case .div: return "div"
		case .a: return "a"
		case .button: return "button"
		case .input: return "input"
		case .form: return "form"
		case .hr: return "hr"
		case .style: return "style"
		case .h1: return "h1"
		case .h2: return "h2"
		case .h3: return "h3"
		case .h4: return "h4"
		case .h5: return "h5"
		case .h6: return "h6"
		case .p: return "p"
		case .img: return "img"
		case .section: return "section"
		case .article: return "article"
		case .nav: return "nav"
		case .header: return "header"
		case .footer: return "footer"
		case .main: return "main"
		case .aside: return "aside"
		case .details: return "details"
		case .summary: return "summary"
		case .canvas: return "canvas"
		case .video: return "video"
		case .audio: return "audio"
		case .table: return "table"
		case .thead: return "thead"
		case .tbody: return "tbody"
		case .tr: return "tr"
		case .th: return "th"
		case .td: return "td"
		case .label: return "label"
		case .select: return "select"
		case .option: return "option"
		case .textarea: return "textarea"
		case .strong: return "strong"
		case .b: return "b"
		}
	}
}
