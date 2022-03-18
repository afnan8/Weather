//
//  CityHistoryViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import UIKit

class CityHistoryViewController: UIViewController {

//    @IBOutlet weak var backButton: ShadowButton!
//    @IBOutlet weak var tableView: UITableView!
//    
    var viewModel: CityHistoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.createBackground()
    }

    @IBAction func back(_ sender: UIButton) {
        
    }
}
