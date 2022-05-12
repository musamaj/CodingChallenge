//
//  UIColor+Extenstions.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import UIKit

public enum AppColorTheme {
    case ap
    case household
}

public enum AppColorType {
    case primary
    case primaryDark
    case primaryLight
    case primarySoft
    case primaryAlt
    case grey
    case greyDark
    case greyLight
    case greyExtraLight
    case success
    case warning
    case error
    case secondaryBlue
    case secondaryOrange
    case secondaryGreen
    case secondaryMagenta
    case white
    case black
    case separatorGrey
    case initials
    case tableViewCellGreen
    case iconHolder
    case icon
    case cellLight
    case errorDark
}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType, forTheme theme: AppColorTheme = .ap) -> UIColor {
        
        
        switch (theme, colorType) {
        case (.ap, .primary):                  return #colorLiteral(red: 0.368627451, green: 0.2078431373, blue: 0.6941176471, alpha: 1)
        case (.ap, .primaryLight):             return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.ap, .primaryDark):              return #colorLiteral(red: 0.1529999971, green: 0.1330000013, blue: 0.3840000033, alpha: 1)
        case (.ap, .primarySoft):              return #colorLiteral(red: 0.6509803922, green: 0.5098039216, blue: 1, alpha: 1)
        case (.ap, .primaryAlt):               return #colorLiteral(red: 0.7329999804, green: 0.2590000033, blue: 0.9219999909, alpha: 1)
        case (.ap, .grey):                     return #colorLiteral(red: 0.7879999876, green: 0.7839999795, blue: 0.8470000029, alpha: 1)
        case (.ap, .greyLight):                return #colorLiteral(red: 0.8549019608, green: 0.878000021, blue: 0.9409999847, alpha: 1)
        case (.ap, .greyExtraLight):           return #colorLiteral(red: 0.9294117647, green: 0.9411764706, blue: 0.9725490196, alpha: 1)
        case (.ap, .greyDark):                 return #colorLiteral(red: 0.5764705882, green: 0.5690000057, blue: 0.6940000057, alpha: 1)
        case (.ap, .success):                  return #colorLiteral(red: 0.2669999897, green: 0.8270000219, blue: 0.5370000005, alpha: 1)
        case (.ap, .warning):                  return #colorLiteral(red: 1, green: 0.7689999938, blue: 0.1879999936, alpha: 1)
        case (.ap, .error):                    return #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        case (.ap, .secondaryBlue):            return #colorLiteral(red: 0.2784313725, green: 0.5529411765, blue: 0.9568627451, alpha: 1)
        case (.ap, .secondaryOrange):          return #colorLiteral(red: 0.9607843137, green: 0.4980392157, blue: 0.09019607843, alpha: 1)
        case (.ap, .secondaryGreen):           return #colorLiteral(red: 0, green: 0.7254901961, blue: 0.6823529412, alpha: 1)
        case (.ap, .secondaryMagenta):         return #colorLiteral(red: 0.9568627451, green: 0.2784313725, blue: 0.4549019608, alpha: 1)
        case (.ap, .white):                    return .white
        case (.ap, .black):                    return .black
        case (.ap, .separatorGrey):            return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        case (.ap, .initials):                 return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.ap, .tableViewCellGreen):       return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
        case (.ap, .iconHolder):               return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case (.ap, .icon):                     return #colorLiteral(red: 0.368627451, green: 0.2078431373, blue: 0.6941176471, alpha: 1)
        case (.ap, .cellLight):                return #colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9764705882, alpha: 1)
        case (.ap, .errorDark):                return #colorLiteral(red: 0.8784313725, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
        case (.household, .primary):            return #colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.3254901961, alpha: 1)
        case (.household, .primaryLight):       return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.household, .primaryDark):        return #colorLiteral(red: 0.1019607843, green: 0.07843137255, blue: 0, alpha: 1)
        case (.household, .primarySoft):        return #colorLiteral(red: 0.9803921569, green: 0.8941176471, blue: 0.8823529412, alpha: 1)
        case (.household, .primaryAlt):         return #colorLiteral(red: 0.7329999804, green: 0.2590000033, blue: 0.9219999909, alpha: 1)
        case (.household, .grey):               return #colorLiteral(red: 0.7879999876, green: 0.7839999795, blue: 0.8470000029, alpha: 1)
        case (.household, .greyLight):          return #colorLiteral(red: 0.8549019608, green: 0.878000021, blue: 0.9409999847, alpha: 1)
        case (.household, .greyExtraLight):     return #colorLiteral(red: 0.9294117647, green: 0.9411764706, blue: 0.9725490196, alpha: 1)
        case (.household, .greyDark):           return #colorLiteral(red: 0.5759999752, green: 0.5690000057, blue: 0.6940000057, alpha: 1)
        case (.household, .success):            return #colorLiteral(red: 0.2669999897, green: 0.8270000219, blue: 0.5370000005, alpha: 1)
        case (.household, .warning):            return #colorLiteral(red: 1, green: 0.7689999938, blue: 0.1879999936, alpha: 1)
        case (.household, .error):              return #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        case (.household, .secondaryBlue):      return #colorLiteral(red: 0.2784313725, green: 0.5529411765, blue: 0.9568627451, alpha: 1)
        case (.household, .secondaryOrange):    return #colorLiteral(red: 0.9607843137, green: 0.4980392157, blue: 0.09019607843, alpha: 1)
        case (.household, .secondaryGreen):     return #colorLiteral(red: 0, green: 0.7254901961, blue: 0.6823529412, alpha: 1)
        case (.household, .secondaryMagenta):   return #colorLiteral(red: 0.9568627451, green: 0.2784313725, blue: 0.4549019608, alpha: 1)
        case (.household, .white):              return .white
        case (.household, .black):              return .black
        case (.household, .separatorGrey):      return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        case (.household, .initials):           return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.household, .tableViewCellGreen): return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
        case (.household, .iconHolder):         return #colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.3254901961, alpha: 1)
        case (.household, .icon):               return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case (.household, .cellLight):          return #colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9764705882, alpha: 1)
        case (.household, .errorDark):          return #colorLiteral(red: 0.8784313725, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
        }
    }
    
    static var primary: UIColor {
        return appColor(ofType: .primary)
    }
    
    static var primaryLight: UIColor {
        return appColor(ofType: .primaryLight)
    }
    
    static var primaryDark: UIColor {
        return appColor(ofType: .primaryDark)
    }
    
    static var primarySoft: UIColor {
        return appColor(ofType: .primarySoft)
    }
    
    static var primaryAlt: UIColor {
        return appColor(ofType: .primaryAlt)
    }
    
    static var grey: UIColor {
        return appColor(ofType: .grey)
    }
    
    static var greyDark: UIColor {
        return appColor(ofType: .greyDark)
    }
    
    static var greyLight: UIColor {
        return appColor(ofType: .greyLight)
    }
    
    static var greyExtraLight: UIColor {
        return appColor(ofType: .greyExtraLight)
    }
    
    static var success: UIColor {
        return appColor(ofType: .success)
    }
    
    static var warning: UIColor {
        return appColor(ofType: .warning)
    }
    
    static var error: UIColor {
        return appColor(ofType: .error)
    }
    
    static var errorDark: UIColor {
        return appColor(ofType: .errorDark)
    }
    
    static var secondaryBlue: UIColor {
        return appColor(ofType: .secondaryBlue)
    }
    
    static var secondaryGreen: UIColor {
        return appColor(ofType: .secondaryGreen)
    }
    
    static var secondaryOrange: UIColor {
        return appColor(ofType: .secondaryOrange)
    }
    
    static var secondaryMagenta: UIColor {
        return appColor(ofType: .secondaryMagenta)
    }
    
    static var initials: UIColor {
        return appColor(ofType: .initials)
    }
    
    static var cell: UIColor {
        return appColor(ofType: .tableViewCellGreen)
    }
    
    static var icon: UIColor {
        return appColor(ofType: .icon)
    }
    
    static var iconHolder: UIColor {
        return appColor(ofType: .iconHolder)
    }
}

public extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

public extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

public extension UIColor {
    static func colorFor(listItemIndex: Int) -> UIColor {
        switch listItemIndex % 6 {
        case 0: return .primarySoft
        case 1: return .secondaryOrange
        case 2: return .secondaryMagenta
        case 3: return .secondaryBlue
        case 4: return .secondaryGreen
        default: return .primary
        }
    }
    
    static func randomColor()-> UIColor {
        colorFor(listItemIndex: Int.random(in: 0...5))
    }
}

// MARK: Image creation from color

public extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

public extension UIColor {
    static var  householdBackgroundColor: UIColor {
        return UIColor(red: 250/255, green: 228/255, blue: 225/255, alpha: 1.0)
    }
}

public extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

public extension UIColor {
    func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func rgba(r red: Int, g green: Int, b blue: Int, a alpha: Int = 255) -> UIColor {
        UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
    }
}
