//
//  Persistence.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext { persistentContainer.viewContext }

    init() {
        persistentContainer = NSPersistentContainer(name: "Combustivel")

        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed loading persistent stores with error: \(error.localizedDescription)")
            }
        }
    }

    
}
