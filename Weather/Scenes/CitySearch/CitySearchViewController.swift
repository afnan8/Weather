//
//  CitySearchViewController.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import UIKit
import RxSwift

class CitySearchViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .textColor()
        label.text = "Enter city, postcode or airoport location"
        label.font = UIFont.appFontRegular(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.returnKeyType = .search
        searchBar.isTranslucent = true
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.appFontRegular(ofSize: 22)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.accentColor(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelSearch(_:)), for: .touchUpInside)
        return button
    }()
    
    var viewModel: CityViewModel?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.createBackground()
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(cancelButton)
        
        titleLabel.snp.makeConstraints() {
            make in
            make.left.right.equalTo(view)
            make.top.equalTo(additionalSafeAreaInsets.top).offset(16)
        }
     
        searchBar.snp.makeConstraints() {
            make in
            make.left.equalTo(view.snp.left).offset(16)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(view.snp.height).multipliedBy(0.06)
            make.top.equalTo(titleLabel.snp.bottom).offset(19)
        }
        
        cancelButton.snp.makeConstraints() {
            make in
            make.left.equalTo(searchBar.snp.right)
            make.right.equalTo(view.snp.right).offset(-16)
            make.top.bottom.equalTo(searchBar)
        }
    }
    
    @objc func cancelSearch(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
extension CitySearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, text.count > 0 else { return }
        ActivityIndicator.show()
        _ = viewModel?.isfinished.subscribe({ isFinished in 
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        viewModel?.fetchWeather(for: text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
