//
//  AMColors.swift
//  AthleteMinderUI
//
//  Created by Azhar Anwar on 4/6/19.
//  Copyright © 2019 Azhar Anwar. All rights reserved.
//

import UIKit

public enum AMColor {
    case navigationBarBackground,
    background,
    primaryText,
    secondaryText
    
    public var color: UIColor {
        switch self {
        case .navigationBarBackground:
            return UIColor.AMColorFrom(r: 40, g: 41, b: 44)
        case .background:
            return UIColor.AMColorFrom(r: 47, g: 48, b: 51)
        case .primaryText:
            return UIColor.AMColorFrom(r: 248, g: 249, b: 250)
        case .secondaryText:
            return UIColor.AMColorFrom(r: 118, g: 119, b: 122)
        }
    }
}

public enum AMCGColor {
    case gradient
    
    public var cgColors: [Any] {
        switch self {
        case .gradient:
            let topColor = #colorLiteral(red: 0.2470588235, green: 0.8156862745, blue: 0.4039215686, alpha: 1)
            let bottomColor = #colorLiteral(red: 0.3843137255, green: 0.8470588235, blue: 0.6117647059, alpha: 1)
            return [topColor.cgColor, bottomColor.cgColor]
        }
    }
}
