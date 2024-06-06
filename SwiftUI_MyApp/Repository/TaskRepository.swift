//
//  TaskRepository.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 24/04/24.
//

import Foundation
import CoreData

protocol TaskRepository {
    func getTask() -> [Task]
    func createTask() -> Bool
    func updateTask() -> Bool
    func deleteTask() -> Bool
}

class TaskRepositoryImplimentation: TaskRepository {
   // private  let managedObjectTask : NSManagedObjectContext = PersistenceController.shared.container
    
    func getTask() -> [Task] {
        [Task]()
    }
    
    func createTask() -> Bool {
        true
    }
    
    func updateTask() -> Bool {
        true
    }
    
    func deleteTask() -> Bool {
        true
    }
    
}
