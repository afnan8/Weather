//
//  CoreDataOperations.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import CoreData
import RxSwift

open class CityWeatherOperations {
    
    public static let shared = CityWeatherOperations()
    
    private init() {
        
    }
    
    func save(cityWeather: CityWeather) {
        let context = PersistentContainer.shared.newBackgroundContext()
        context.performAndWait { [weak self] in
            guard let self = self else {return}
            let weatherInfoEntity = self.createWeatherInfoEntity(from: cityWeather, context: context)
            if let id = cityWeather.id, let city = self.getCity(with: id, context: context) {
                city.weatherInfo?.insert(weatherInfoEntity)
            } else {
                self.addNewCity(cityWeather: cityWeather, with: weatherInfoEntity, context: context)
            }
            self.save(context: context)
        }
    }
    
    func createWeatherInfoEntity(from cityWeather: CityWeather, context: NSManagedObjectContext) -> WeatherInfo {
        let weatherInfoEntity = WeatherInfo(context: context)
        weatherInfoEntity.descriptionField = cityWeather.weather?.first?.descriptionField
        if let humidity = cityWeather.main?.humidity {
            weatherInfoEntity.humidity = humidity
        }
        if let temp = cityWeather.main?.temp {
            weatherInfoEntity.temp = temp
        }
        if let speed = cityWeather.wind?.speed {
            weatherInfoEntity.speed = speed
        }
        weatherInfoEntity.date = Date()
        return weatherInfoEntity
    }
    
    func addNewCity(cityWeather: CityWeather, with weatherInfo: WeatherInfo, context: NSManagedObjectContext) {
        let cityEntity = City(context: context)
        cityEntity.name = cityWeather.name
        if let id = cityWeather.id {
            cityEntity.id = id
        }
        cityEntity.weatherInfo?.insert(weatherInfo)
    }
    
    func getCity(with id: Int64, context: NSManagedObjectContext = PersistentContainer.shared.newBackgroundContext()) -> City? {
        let fetchRequest = City.fetchRequest
        fetchRequest.predicate =  NSPredicate(format: "id == \(id)")
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.first
        } catch {
            print("Error: Failed to list cities: \(error)")
        }
        return nil
    }
    
    func getCity(with id: Int64) -> Observable<Result<City, Error>> {
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            guard let city = self.getCity(with: id) else {
                observer.onError(APIError.noData)
                return Disposables.create()
            }
            observer.onNext(.success(city))
            return Disposables.create()
        }
    }
//
//    func getWeatherInfo(with date: Date, context: NSManagedObjectContext) -> WeatherInfo? {
//        let fetchRequest = WeatherInfo.fetchRequest
//        var calendar = Calendar.current
//        calendar.timeZone = NSTimeZone.local
//
//        let dateFrom = calendar.startOfDay(for: Date())
//        let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)
//
//        let fromPredicate = NSPredicate(format: "date >= %@", dateFrom as NSDate)
//        let toPredicate = NSPredicate(format: "date < %@", dateTo! as NSDate)
//
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
//        do {
//            let objects = try context.fetch(fetchRequest)
//            return objects.first
//        } catch {
//            print("Error: Failed to list cities: \(error)")
//        }
//        return nil
//    }
    
    func deleteCity(with id: Int64) {
        let context = PersistentContainer.shared.newBackgroundContext()
        guard let city = self.getCity(with: id, context: context) else {return}
        context.delete(city)
        save(context: context)
    }
    
    func listAllCities() -> [City]? {
        do {
            let context = PersistentContainer.shared.viewContext
            let fetchRequest = City.fetchRequest
            let cities = try context.fetch(fetchRequest)
            return cities
        } catch {
            print("Error: Failed to list cities: \(error)")
        }
        return nil
    }
    
    private func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            context.reset()
        } catch {
            print("Error: Failed to insert save request: \(error)")
        }
    }
    
    public func deleteAllRecords() {
        let storeContainer = PersistentContainer.shared.persistentStoreCoordinator
        do {
            // Delete each existing persistent store
            for store in storeContainer.persistentStores {
                try storeContainer.destroyPersistentStore( at: store.url!, ofType: store.type, options: nil)
            }
        }catch {
            print("Failed to delete records: \(error)")
        }
        PersistentContainer.shared.loadPersistentStores()
    }
}


