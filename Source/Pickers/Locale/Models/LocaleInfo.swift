import UIKit

struct LocaleInfo {
    
    var locale: Locale?
    
    var id: String? {
        return locale?.identifier
    }
    
    var country: String
    var code: String
    var phoneCode: String
    
    var flag: UIImage? {
        return UIImage(named: "Countries.bundle/Images/\(code.uppercased())", in: Bundle.main, compatibleWith: nil)
    }
    
    var currencyCode: String? {
        return locale?.currencyCode
    }
    
    var currencySymbol: String? {
        return locale?.currencySymbol
    }
    
    var currencyName: String? {
        guard let currencyCode = currencyCode else { return nil }
        return locale?.localizedString(forCurrencyCode: currencyCode)
    }
    
    init(country: String, code: String, phoneCode: String) {
        self.country = country
        self.code = code
        self.phoneCode = phoneCode
        
        self.locale = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first(where: { $0.regionCode == code })
    }
}
