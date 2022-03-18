//
//  CityHistoryViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import UIKit

protocol CityHistoryViewProtocol: AnyObject {
    func reloadData()
}

class CityHistoryViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .textColor()
        label.numberOfLines = 0
        label.text = "Historical".uppercased()
        label.font = UIFont.appFontBold(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let backButton: UIButton = {
        let button = ShadowButton()
        button.shadowRadius = 24
        button.shadowOffset = CGSize(width: 5, height: 0)
        button.customShadowColor = .blackColor()
        button.shadowOpacity = 0.2
        button.layer.cornerRadius = 24
        button.backgroundColor = .accentColor()
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.appFontRegular(ofSize: 22)
        button.setTitle("←", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var presenter: CityHistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.getCity()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints() {
            make in
            make.left.right.equalTo(view)
            make.centerY.equalTo(backButton.snp.centerY)
        }
        
        backButton.snp.makeConstraints() {
            make in
            make.height.equalTo(view.snp.height).multipliedBy(0.07)
            make.width.equalTo(view.snp.height).multipliedBy(0.09)
            make.left.equalTo(view.snp.left)
            make.top.equalTo(view.safeAreaInsets.top).offset(41)
            make.bottom.equalTo(tableView.snp.top).offset(-38)
        }
        
        tableView.snp.makeConstraints {
            make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom)
        }
        self.view.layoutIfNeeded()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.createBackground()
    }

    @objc func back(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension CityHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfWeatherInfo ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        guard let presenter = presenter else {return cell}
        presenter.configure(cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
extension CityHistoryViewController: CityHistoryViewProtocol {
    
    func reloadData() {
        tableView.reloadData()
    }
}
