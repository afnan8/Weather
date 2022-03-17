//
//  UIView+Extension.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import SnapKit
import UIKit

extension UIView {
    
    func createBackground() {
        let view = gradientBackgroundColor()
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "Background")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.zPosition = 1
            return imageView
        }()
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints() {
            make in
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    private func gradientBackgroundColor() -> UIView {
        let view = GradientView()
        view.startColor = .topGradientColor()
        view.endColor = .bottomGradientColor()
        view.frame = self.frame
        self.addSubview(view)
        return view
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}


