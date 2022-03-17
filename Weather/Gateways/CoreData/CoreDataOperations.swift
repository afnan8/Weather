//
//  CoreDataOperations.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import CoreData

open class CityWeatherOperations {
    
    public static let shared = CityWeatherOperations()
    
    private init() {
        
    }
    
    func save(cityWeather: CityWeather) {
        let context = PersistentContainer.shared.viewContext
        context.performAndWait { [weak self] in
            let cityEntity = City(context: context)
            cityEntity.name = cityWeather.name
            let weatherInfoEntity = WeatherInfo(context: context)
            weatherInfoEntity.descriptionField = cityWeather.weather?.description
            if let humidity = cityWeather.main?.humidity {
                weatherInfoEntity.humidity = humidity
            }
            if let temp = cityWeather.main?.temp {
                weatherInfoEntity.temp = temp
            }
            if let speed = cityWeather.wind?.speed {
                weatherInfoEntity.speed = speed
            }
            self?.save(context: context)
        }
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


