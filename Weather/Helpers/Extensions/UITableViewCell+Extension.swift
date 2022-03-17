//
//  UITableViewCell+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation

extension UITableViewCell {

    func addCustomDisclosureIndicator(with color: UIColor) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 16, height: 22))
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 17, weight: .bold, scale: .large)
        let symbolImage = UIImage(systemName: "chevron.right",
                                  withConfiguration: symbolConfig)
        symbolImage?.withTintColor(color, renderingMode: .alwaysTemplate)
        button.tintColor = color
        button.setImage(symbolImage?.withTintColor(color, renderingMode: .alwaysOriginal), for: .normal)
        self.accessoryView = button
    }
}
