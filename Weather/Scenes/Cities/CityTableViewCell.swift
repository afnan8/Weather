//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
//        self.textLabel?.textColor =
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
