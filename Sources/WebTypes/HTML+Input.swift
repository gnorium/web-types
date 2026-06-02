import EmbeddedSwiftUtilities

extension HTML {
  #if SERVER
    public enum Input {
      public enum `Type`: String, Sendable {
        case text = "text"
        case hidden = "hidden"
        case password = "password"
        case email = "email"
        case number = "number"
        case tel = "tel"
        case url = "url"
        case search = "search"
        case date = "date"
        case time = "time"
        case datetimeLocal = "datetime-local"
        case month = "month"
        case week = "week"
        case color = "color"
        case file = "file"
        case image = "image"
        case checkbox = "checkbox"
        case radio = "radio"
        case range = "range"
        case submit = "submit"
        case reset = "reset"
        case button = "button"
      }

      public enum Autocomplete: String, Sendable {
        case off = "off"
        case on = "on"
        case name = "name"
        case honorificPrefix = "honorific-prefix"
        case givenName = "given-name"
        case additionalName = "additional-name"
        case familyName = "family-name"
        case honorificSuffix = "honorific-suffix"
        case nickname = "nickname"
        case email = "email"
        case username = "username"
        case impp = "impp"
        case newPassword = "new-password"
        case currentPassword = "current-password"
        case oneTimeCode = "one-time-code"
        case organizationTitle = "organization-title"
        case organization = "organization"
        case streetAddress = "street-address"
        case addressLine1 = "address-line1"
        case addressLine2 = "address-line2"
        case addressLine3 = "address-line3"
        case addressLevel1 = "address-level1"
        case addressLevel2 = "address-level2"
        case addressLevel3 = "address-level3"
        case addressLevel4 = "address-level4"
        case country = "country"
        case countryName = "country-name"
        case postalCode = "postal-code"
        case ccName = "cc-name"
        case ccGivenName = "cc-given-name"
        case ccAdditionalName = "cc-additional-name"
        case ccFamilyName = "cc-family-name"
        case ccNumber = "cc-number"
        case ccExp = "cc-exp"
        case ccExpMonth = "cc-exp-month"
        case ccExpYear = "cc-exp-year"
        case ccCsc = "cc-csc"
        case ccType = "cc-type"
        case transactionCurrency = "transaction-currency"
        case transactionAmount = "transaction-amount"
        case language = "language"
        case bday = "bday"
        case bdayDay = "bday-day"
        case bdayMonth = "bday-month"
        case bdayYear = "bday-year"
        case sex = "sex"
        case tel = "tel"
        case telCountryCode = "tel-country-code"
        case telNational = "tel-national"
        case telAreaCode = "tel-area-code"
        case telLocal = "tel-local"
        case telExtension = "tel-extension"
        case url = "url"
        case photo = "photo"
      }
    }
  #endif

  #if CLIENT
    public enum Input {
      public enum `Type`: Sendable, RawRepresentable {
        case text
        case hidden
        case password
        case email
        case number
        case tel
        case url
        case search
        case date
        case time
        case datetimeLocal
        case month
        case week
        case color
        case file
        case image
        case checkbox
        case radio
        case range
        case submit
        case reset
        case button

        public var rawValue: String {
          switch self {
          case .text: return "text"
          case .hidden: return "hidden"
          case .password: return "password"
          case .email: return "email"
          case .number: return "number"
          case .tel: return "tel"
          case .url: return "url"
          case .search: return "search"
          case .date: return "date"
          case .time: return "time"
          case .datetimeLocal: return "datetime-local"
          case .month: return "month"
          case .week: return "week"
          case .color: return "color"
          case .file: return "file"
          case .image: return "image"
          case .checkbox: return "checkbox"
          case .radio: return "radio"
          case .range: return "range"
          case .submit: return "submit"
          case .reset: return "reset"
          case .button: return "button"
          }
        }

        public init?(rawValue: String) {
          if stringEquals(rawValue, "text") {
            self = .text
          } else if stringEquals(rawValue, "hidden") {
            self = .hidden
          } else if stringEquals(rawValue, "password") {
            self = .password
          } else if stringEquals(rawValue, "email") {
            self = .email
          } else if stringEquals(rawValue, "number") {
            self = .number
          } else if stringEquals(rawValue, "tel") {
            self = .tel
          } else if stringEquals(rawValue, "url") {
            self = .url
          } else if stringEquals(rawValue, "search") {
            self = .search
          } else if stringEquals(rawValue, "date") {
            self = .date
          } else if stringEquals(rawValue, "time") {
            self = .time
          } else if stringEquals(rawValue, "datetime-local") {
            self = .datetimeLocal
          } else if stringEquals(rawValue, "month") {
            self = .month
          } else if stringEquals(rawValue, "week") {
            self = .week
          } else if stringEquals(rawValue, "color") {
            self = .color
          } else if stringEquals(rawValue, "file") {
            self = .file
          } else if stringEquals(rawValue, "image") {
            self = .image
          } else if stringEquals(rawValue, "checkbox") {
            self = .checkbox
          } else if stringEquals(rawValue, "radio") {
            self = .radio
          } else if stringEquals(rawValue, "range") {
            self = .range
          } else if stringEquals(rawValue, "submit") {
            self = .submit
          } else if stringEquals(rawValue, "reset") {
            self = .reset
          } else if stringEquals(rawValue, "button") {
            self = .button
          } else {
            return nil
          }
        }
      }

      public enum Autocomplete: Sendable, RawRepresentable {
        case off
        case on
        case name
        case honorificPrefix
        case givenName
        case additionalName
        case familyName
        case honorificSuffix
        case nickname
        case email
        case username
        case impp
        case newPassword
        case currentPassword
        case oneTimeCode
        case organizationTitle
        case organization
        case streetAddress
        case addressLine1
        case addressLine2
        case addressLine3
        case addressLevel1
        case addressLevel2
        case addressLevel3
        case addressLevel4
        case country
        case countryName
        case postalCode
        case ccName
        case ccGivenName
        case ccAdditionalName
        case familyNameExtra
        case ccNumber
        case ccExp
        case ccExpMonth
        case ccExpYear
        case ccCsc
        case ccType
        case transactionCurrency
        case transactionAmount
        case language
        case bday
        case bdayDay
        case bdayMonth
        case bdayYear
        case sex
        case tel
        case telCountryCode
        case telNational
        case telAreaCode
        case telLocal
        case telExtension
        case url
        case photo

        public var rawValue: String {
          switch self {
          case .off: return "off"
          case .on: return "on"
          case .name: return "name"
          case .honorificPrefix: return "honorific-prefix"
          case .givenName: return "given-name"
          case .additionalName: return "additional-name"
          case .familyName: return "family-name"
          case .honorificSuffix: return "honorific-suffix"
          case .nickname: return "nickname"
          case .email: return "email"
          case .username: return "username"
          case .impp: return "impp"
          case .newPassword: return "new-password"
          case .currentPassword: return "current-password"
          case .oneTimeCode: return "one-time-code"
          case .organizationTitle: return "organization-title"
          case .organization: return "organization"
          case .streetAddress: return "street-address"
          case .addressLine1: return "address-line1"
          case .addressLine2: return "address-line2"
          case .addressLine3: return "address-line3"
          case .addressLevel1: return "address-level1"
          case .addressLevel2: return "address-level2"
          case .addressLevel3: return "address-level3"
          case .addressLevel4: return "address-level4"
          case .country: return "country"
          case .countryName: return "country-name"
          case .postalCode: return "postal-code"
          case .ccName: return "cc-name"
          case .ccGivenName: return "cc-given-name"
          case .ccAdditionalName: return "cc-additional-name"
          case .familyNameExtra: return "cc-family-name"
          case .ccNumber: return "cc-number"
          case .ccExp: return "cc-exp"
          case .ccExpMonth: return "cc-exp-month"
          case .ccExpYear: return "cc-exp-year"
          case .ccCsc: return "cc-csc"
          case .ccType: return "cc-type"
          case .transactionCurrency: return "transaction-currency"
          case .transactionAmount: return "transaction-amount"
          case .language: return "language"
          case .bday: return "bday"
          case .bdayDay: return "bday-day"
          case .bdayMonth: return "bday-month"
          case .bdayYear: return "bday-year"
          case .sex: return "sex"
          case .tel: return "tel"
          case .telCountryCode: return "tel-country-code"
          case .telNational: return "tel-national"
          case .telAreaCode: return "tel-area-code"
          case .telLocal: return "tel-local"
          case .telExtension: return "tel-extension"
          case .url: return "url"
          case .photo: return "photo"
          }
        }

        public init?(rawValue: String) {
          if stringEquals(rawValue, "off") {
            self = .off
          } else if stringEquals(rawValue, "on") {
            self = .on
          } else if stringEquals(rawValue, "name") {
            self = .name
          } else if stringEquals(rawValue, "honorific-prefix") {
            self = .honorificPrefix
          } else if stringEquals(rawValue, "given-name") {
            self = .givenName
          } else if stringEquals(rawValue, "additional-name") {
            self = .additionalName
          } else if stringEquals(rawValue, "family-name") {
            self = .familyName
          } else if stringEquals(rawValue, "honorific-suffix") {
            self = .honorificSuffix
          } else if stringEquals(rawValue, "nickname") {
            self = .nickname
          } else if stringEquals(rawValue, "email") {
            self = .email
          } else if stringEquals(rawValue, "username") {
            self = .username
          } else if stringEquals(rawValue, "impp") {
            self = .impp
          } else if stringEquals(rawValue, "new-password") {
            self = .newPassword
          } else if stringEquals(rawValue, "current-password") {
            self = .currentPassword
          } else if stringEquals(rawValue, "one-time-code") {
            self = .oneTimeCode
          } else if stringEquals(rawValue, "organization-title") {
            self = .organizationTitle
          } else if stringEquals(rawValue, "organization") {
            self = .organization
          } else if stringEquals(rawValue, "street-address") {
            self = .streetAddress
          } else if stringEquals(rawValue, "address-line1") {
            self = .addressLine1
          } else if stringEquals(rawValue, "address-line2") {
            self = .addressLine2
          } else if stringEquals(rawValue, "address-line3") {
            self = .addressLine3
          } else if stringEquals(rawValue, "address-level1") {
            self = .addressLevel1
          } else if stringEquals(rawValue, "address-level2") {
            self = .addressLevel2
          } else if stringEquals(rawValue, "address-level3") {
            self = .addressLevel3
          } else if stringEquals(rawValue, "address-level4") {
            self = .addressLevel4
          } else if stringEquals(rawValue, "country") {
            self = .country
          } else if stringEquals(rawValue, "country-name") {
            self = .countryName
          } else if stringEquals(rawValue, "postal-code") {
            self = .postalCode
          } else if stringEquals(rawValue, "cc-name") {
            self = .ccName
          } else if stringEquals(rawValue, "cc-given-name") {
            self = .ccGivenName
          } else if stringEquals(rawValue, "cc-additional-name") {
            self = .ccAdditionalName
          } else if stringEquals(rawValue, "cc-family-name") {
            self = .familyNameExtra
          } else if stringEquals(rawValue, "cc-number") {
            self = .ccNumber
          } else if stringEquals(rawValue, "cc-exp") {
            self = .ccExp
          } else if stringEquals(rawValue, "cc-exp-month") {
            self = .ccExpMonth
          } else if stringEquals(rawValue, "cc-exp-year") {
            self = .ccExpYear
          } else if stringEquals(rawValue, "cc-csc") {
            self = .ccCsc
          } else if stringEquals(rawValue, "cc-type") {
            self = .ccType
          } else if stringEquals(rawValue, "transaction-currency") {
            self = .transactionCurrency
          } else if stringEquals(rawValue, "transaction-amount") {
            self = .transactionAmount
          } else if stringEquals(rawValue, "language") {
            self = .language
          } else if stringEquals(rawValue, "bday") {
            self = .bday
          } else if stringEquals(rawValue, "bday-day") {
            self = .bdayDay
          } else if stringEquals(rawValue, "bday-month") {
            self = .bdayMonth
          } else if stringEquals(rawValue, "bday-year") {
            self = .bdayYear
          } else if stringEquals(rawValue, "sex") {
            self = .sex
          } else if stringEquals(rawValue, "tel") {
            self = .tel
          } else if stringEquals(rawValue, "tel-country-code") {
            self = .telCountryCode
          } else if stringEquals(rawValue, "tel-national") {
            self = .telNational
          } else if stringEquals(rawValue, "tel-area-code") {
            self = .telAreaCode
          } else if stringEquals(rawValue, "tel-local") {
            self = .telLocal
          } else if stringEquals(rawValue, "tel-extension") {
            self = .telExtension
          } else if stringEquals(rawValue, "url") {
            self = .url
          } else if stringEquals(rawValue, "photo") {
            self = .photo
          } else {
            return nil
          }
        }
      }
    }
  #endif

}
