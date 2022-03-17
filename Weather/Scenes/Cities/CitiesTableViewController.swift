//
//  CitiesTableViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import SnapKit
import UIKit

class CitiesTableViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .textColor()
        label.text = "Cities".uppercased()
        label.font = UIFont.appFontBold(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addCityButton: UIButton = {
        let button = ShadowButton()
        button.shadowRadius = 24
        button.shadowOffset = CGSize(width: 5, height: 0)
        button.customShadowColor = .blackColor()
        button.shadowOpacity = 0.2
        button.layer.cornerRadius = 24
        button.backgroundColor = .accentColor()
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.appFontRegular(ofSize: 22)
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addCity(_:)), for: .touchUpInside)
        return button
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        let colorTop: UIColor = .accentColor()
        let colorBottom: UIColor = .accentColor()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.gradientBackgroundColor()
        layout()
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(addCityButton)
        view.addSubview(tableView)
        view.addSubview(backgroundImageView)
        titleLabel.snp.makeConstraints() {
            make in
            make.left.right.equalTo(view)
            make.centerY.equalTo(addCityButton.snp.centerY)
        }
        addCityButton.snp.makeConstraints() {
            make in
            make.height.equalTo(view.snp.height).multipliedBy(0.07)
            make.width.equalTo(view.snp.height).multipliedBy(0.09)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.safeAreaInsets.top).offset(41)
            make.bottom.equalTo(tableView.snp.top).offset(-38)
        }
        tableView.snp.makeConstraints {
            make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom)
        }
        backgroundImageView.snp.makeConstraints() {
            make in
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        self.view.layoutIfNeeded()
    }
    
    @objc func addCity(_ sender: UIButton) {
        
    }
}
extension CitiesTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.bounds.height * 0.07
    }
    
}
