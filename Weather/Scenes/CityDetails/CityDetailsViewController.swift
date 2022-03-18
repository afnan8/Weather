//
//  CityDetailsViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import UIKit

protocol CityDetailsViewProtocol {
    
}

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
