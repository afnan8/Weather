//
//  CityHistoryPresenter.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 18/03/2022.
//

import Foundation
import UIKit

protocol CityHistoryPresenterProtocol {
    var numberOfWeatherInfo: Int { get }
    func configure(_ cell: UITableViewCell, at row: Int)
    func getCity()
}

class CityHistoryPresenter {
    
    weak var view: CityHistoryViewProtocol?
    private var id: Int64
    private var city: CityItem?

    init(view: CityHistoryViewProtocol, id: Int64) {
        self.id = id
        self.view = view
    }
        
}

extension CityHistoryPresenter: CityHistoryPresenterProtocol {
   
    func configure(_ cell: UITableViewCell, at row: Int) {
        guard let weatherInfo = city?.weatherInformation[row] else {return}
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.textLabel?.text = weatherInfo.date.convertDateToString()
        cell.detailTextLabel?.text = "\(weatherInfo.temp)"
    }
    
    func getCity() {
        guard let city = CityWeatherOperations.shared.getCity(with: id) else {return}
        self.city = CityItem(city)
        self.view?.reloadData()
    }

    var numberOfWeatherInfo: Int {
        return city?.weatherInformation.count ?? 0
    }
}
