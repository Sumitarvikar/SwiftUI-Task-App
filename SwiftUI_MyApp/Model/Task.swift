//
//  Task.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 16/04/24.
//

import Foundation
struct Task {
    let id  : Int
    var name : String
    var description: String
    var isCompleted : Bool
    var finishDate : Date
    
    
    static func createMockData() -> [Task]{
        let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           
           let task1 = Task(id: 1, name: "Task 1", description: "Description for Task 1", isCompleted: true, finishDate: dateFormatter.date(from: "2024-04-18 10:00:00")!)
           let task2 = Task(id: 2, name: "Task 2", description: "Description for Task 2", isCompleted: false, finishDate: dateFormatter.date(from: "2024-04-20 15:30:00")!)
           let task3 = Task(id: 3, name: "Task 3", description: "Description for Task 3", isCompleted: true, finishDate: dateFormatter.date(from: "2024-04-22 12:00:00")!)
           
           return [task1, task2, task3]
    }
    
}
