//
//  UIColor+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import UIKit

extension UIColor {

    class func accentColor() -> UIColor {
        guard let color = UIColor(named: "Accent_color") else {
          return #colorLiteral(red: 0.7730000019, green: 0.1959999949, blue: 0.2860000134, alpha: 1)
        }
        return color
    }
    
    class func blackColor() -> UIColor {
        guard let color = UIColor(named: "Black_color") else {
          return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return color
    }
    
    class func bottomGradientColor() -> UIColor {
        guard let color = UIColor(named: "Bottom_gradient_color") else {
          return #colorLiteral(red: 0.1410000026, green: 0.1369999945, blue: 0.1449999958, alpha: 1)
        }
        return color
    }
    
    class func textColor() -> UIColor {
        guard let color = UIColor(named: "Text_color") else {
          return #colorLiteral(red: 0.474999994, green: 0.4979999959, blue: 0.5329999924, alpha: 1)
        }
        return color
    }
    
    
    class func topGradientColor() -> UIColor {
        guard let color = UIColor(named: "Top_gradient_color") else {
          return #colorLiteral(red: 0.1490000039, green: 0.1490000039, blue: 0.1529999971, alpha: 1)
        }
        return color
    }
    

    
}
