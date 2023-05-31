//
//  ActivityController.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 25.05.2023.
//

import Foundation
import CoreData

class ActivityController: ObservableObject {
    let container = NSPersistentContainer(name: "User")
    
    init() {
        container.loadPersistentStores { details, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Error: Couldn't save")
        }
    }
    
    func addActivity(action: String, context: NSManagedObjectContext) {
        let activity = Activity(context: context)
        
        activity.id = UUID()
        activity.action = action
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        activity.timestamp = dateFormatter.date(from: formattedDate)
    }
}
