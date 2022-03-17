//
//  UIView+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import SnapKit
import UIKit

extension UIView {
    
    func gradientBackgroundColor() {
        let view = GradientView()
        view.startColor = .topGradientColor()
        view.endColor = .bottomGradientColor()
        view.frame = self.frame
        self.addSubview(view)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}


