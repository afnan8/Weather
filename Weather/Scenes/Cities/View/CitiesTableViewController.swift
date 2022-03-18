//
//  CitiesTableViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

import SnapKit
import RxSwift
import RxCocoa

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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel: CitiesViewModel?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        tableView.rowHeight = view.bounds.height * 0.07
        bindViewModel()
        viewModel?.loadCities()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.createBackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(addCityButton)
        view.addSubview(tableView)
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
        self.view.layoutIfNeeded()
    }
    
    func bindViewModel() {
        self.viewModel?.citiesItems.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: CityTableViewCell.identifier, cellType: CityTableViewCell.self)) { index, name, cell in
            cell.setCityName(with: name)
        }.disposed(by: self.disposeBag)
        
        tableView.rx.itemDeleted.subscribe (onNext: { [weak self] indexPath in
            guard let self = self else {return}
            self.viewModel?.deleteCity(at: indexPath.row)
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else {return}
            guard let id = self.viewModel?.getCityId(at: indexPath.row) else {return}
            self.openCityHistory(for: id)
        }).disposed(by: disposeBag)
    }
    
    func openCityHistory(for cityId: Int64) {
        navigate(to: CityRoute.showCityHistory(id: cityId))
    }
    
    @objc func addCity(_ sender: UIButton) {
        navigate(to: CityRoute.addCity(delegate: self))
    }
}
extension CitiesTableViewController: CitySearch {
    func isAdded() {
        viewModel?.loadCities()
    }
}
