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
        return UIFont(name: fontName, size: size)!
    }

    class func appFontRegular(ofSize size: CGFloat) -> UIFont {
        let fontName = "SFProText-Regular"
        return UIFont(name: fontName, size: size)!
    }
}

