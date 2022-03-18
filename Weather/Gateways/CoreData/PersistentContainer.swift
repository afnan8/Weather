//
//  PersistentContainer.swift
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

import Foundation
import CoreData

open class PersistentContainer: NSPersistentContainer {
    
    public static let shared = PersistentContainer(name: "Weather")
    //serial queue
    private let backgroundQueue = DispatchQueue(label: "PersistentContainerBackground", qos: .background)
    
    open override func newBackgroundContext() -> NSManagedObjectContext {
        let context = super.newBackgroundContext()
        context.name = "background_context"
        context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        context.automaticallyMergesChangesFromParent = true
        return context
    }
    
    public func loadPersistentStores() {
        backgroundQueue.sync { [weak self] in
            guard let self = self else {return}
            self.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                     fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            self.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        }
    }
}
