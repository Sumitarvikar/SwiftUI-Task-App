//
//  TaskViewModel.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 16/04/24.
//

import Foundation
class TaskViewModel : ObservableObject{
    
    @Published var tasks : [Task] = []
    private  var tempTask = Task.createMockData()
    
    func getTask(isActive :  Bool){
        tasks = tempTask.filter({$0.isCompleted  == !isActive})
        
    }
    func  addTask(task :Task)  -> Bool {
        let taskid = Int.random(in: 4...100)
        let newTask = Task(id: taskid , name: task.name, description: task.description, isCompleted: task.isCompleted, finishDate: task.finishDate)
        tempTask.append(newTask)
        
        return true
        
    }
    
    func updateTask(task : Task )-> Bool{
        if let index =  tempTask.firstIndex(where: {$0.id ==  task.id}){
            tempTask[index] = task
            return true
        }
        return false
    }
    
    func deleteTask(task :  Task) ->  Bool{
        if  let index  =  tempTask.firstIndex(where: {$0.id  == task.id}){
            tempTask.remove(at: index)
            return true
        }
        return false
    }
    
}
