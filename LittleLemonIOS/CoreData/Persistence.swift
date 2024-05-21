//
//  Persistence.swift
//  LittleLemonIOS
//
//  Created by أثير on 12/11/1445 AH.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "DataBase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: shared.container.viewContext)
        dish.title = "Greek Salad"
        dish.descriptionDish = "The famous greek salad of crispy lettuce, peppers, olives, our Chicago."
        dish.price = "10"
        dish.category = "starters"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        return dish
    }
}
