//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CityTableViewCell.identifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.addCustomDisclosureIndicator(with: .accentColor()) 
        self.textLabel?.font = UIFont.appFontBold(ofSize: 17)
        self.textLabel?.textColor = .textColor()
    }
    
    func setCityName(with name: String) {
        textLabel?.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
