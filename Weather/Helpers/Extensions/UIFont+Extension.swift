//
//  UIFont+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import UIKit

extension UIFont {
    
    class func appFontBold(ofSize size: CGFloat) -> UIFont {
        let fontName = "SFProText-Bold"
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont(name: fontName, size: size * 1.8)!
        } else if UIScreen.main.bounds.height > 667 {
            return UIFont(name: fontName, size: size * 1.3)!
        }
        return UIFont(name: fontName, size: size)!
    }

    class func appFontRegular(ofSize size: CGFloat) -> UIFont {
        let fontName = "SFProText-Regular"
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont(name: fontName, size: size * 1.8)!
        } else if UIScreen.main.bounds.height > 667 {
            return UIFont(name: fontName, size: size * 1.3)!
        }
        return UIFont(name: fontName, size: size)!
    }
}

