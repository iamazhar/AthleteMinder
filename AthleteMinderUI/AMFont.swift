//
//  AMFont.swift
//  AthleteMinderUI
//
//  Created by Azhar Anwar on 4/6/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit

public extension UIFont {
    static func AM_black(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Black", size: size)!
    }
    
    static func AM_black_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-BlackCondensed", size: size)!
    }
    
    static func AM_black_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-BlackItalic", size: size)!
    }
    
    static func AM_bold(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Bold", size: size)!
    }
    
    static func AM_bold_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-BlackCondensed", size: size)!
    }
    
    static func AM_bold_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-BoldItalic", size: size)!
    }
    
    static func AM_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Condensed", size: size)!
    }
    
    static func AM_heavy(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Heavy", size: size)!
    }
    
    static func AM_heavy_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-HeavyCondensed", size: size)!
    }
    
    static func AM_heavy_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-HeavyItalic", size: size)!
    }
    
    static func AM_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Italic", size: size)!
    }
    
    static func AM_light(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Light", size: size)!
    }
    
    static func AM_light_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-LightCondensed", size: size)!
    }
    
    static func AM_light_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-LightItalic", size: size)!
    }
    
    static func AM_medium(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Medium", size: size)!
    }
    
    static func AM_medium_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-MediumCond", size: size)!
    }
    
    static func AM_medium_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-MediumCond", size: size)!
    }
    
    static func AM_regular(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-Regular", size: size)!
    }
    
    static func AM_ultra_light(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-UltraLight", size: size)!
    }
    
    static func AM_ultra_light_condensed(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-UltraLightCond", size: size)!
    }
    
    static func AM_ultra_light_italic(size: CGFloat) -> UIFont{
        return UIFont(name: "DINNextLTPro-UltraLightIt", size: size)!
    }
}

public enum AMFont {
    case
    black,
    blackCondensed,
    blackItalic,
    bold,
    boldCondensed,
    boldItalic,
    condensed,
    heavy,
    heavyCondensed,
    heavyItalic,
    italic,
    light,
    lightCondensed,
    lightItalic,
    medium,
    mediumCondensed,
    mediumItalic,
    regular,
    ultraLight,
    ultraLightCondensed,
    ultraLightItalic
    
    public func of(size: AMFontSize) -> UIFont {
        switch self {
        case .black:
            return UIFont.AM_black(size: size.value)
        case .blackCondensed:
            return UIFont.AM_black_condensed(size: size.value)
        case .blackItalic:
            return UIFont.AM_black_italic(size: size.value)
        case .bold:
            return UIFont.AM_bold(size: size.value)
        case .boldCondensed:
            return UIFont.AM_bold_condensed(size: size.value)
        case .boldItalic:
            return UIFont.AM_bold_italic(size: size.value)
        case .condensed:
            return UIFont.AM_condensed(size: size.value)
        case .heavy:
            return UIFont.AM_heavy(size: size.value)
        case .heavyCondensed:
            return UIFont.AM_heavy_condensed(size: size.value)
        case .heavyItalic:
            return UIFont.AM_heavy_italic(size: size.value)
        case .italic:
            return UIFont.AM_italic(size: size.value)
        case .light:
            return UIFont.AM_light(size: size.value)
        case .lightCondensed:
            return UIFont.AM_light_condensed(size: size.value)
        case .lightItalic:
            return UIFont.AM_light_italic(size: size.value)
        case .medium:
            return UIFont.AM_medium(size: size.value)
        case .mediumCondensed:
            return UIFont.AM_medium_condensed(size: size.value)
        case .mediumItalic:
            return UIFont.AM_medium_italic(size: size.value)
        case .regular:
            return UIFont.AM_regular(size: size.value)
        case .ultraLight:
            return UIFont.AM_ultra_light(size: size.value)
        case .ultraLightCondensed:
            return UIFont.AM_ultra_light_condensed(size: size.value)
        case .ultraLightItalic:
            return UIFont.AM_ultra_light_italic(size: size.value)
        }
    }
    
}

public enum AMFontSize {
    case
    small,
    average,
    large,
    larger
    
    public var value: CGFloat {
        switch self {
        case .small:
            return 11
        case .average:
            return 14
        case .large:
            return 17
        case .larger:
            return 20
        }
    }
}
