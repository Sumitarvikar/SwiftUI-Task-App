//
//  AddTaskView.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 19/04/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var taskToAdd: Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    @Binding  var showAddTaskView :  Bool
    @ObservedObject var taskVM : TaskViewModel
    @State private  var showCancelAlert : Bool = false
    
    var daterannge : ClosedRange<Date>{
        
        var date = Calendar.current
        let currentdate  = date.dateComponents([.day , .month , .year , .hour , .minute], from: Date())
        let startDateComponent  = DateComponents(year: currentdate.year, month: currentdate.month   , day: currentdate.day ,  hour: currentdate.hour, minute:  currentdate.minute )
        let  endDateComponennt = DateComponents(year : 2024  ,  month:  12 , day : 30 )
        
        return date.date(from: startDateComponent)!  ... date.date(from: endDateComponennt)!
    }
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task Details")) {
                    TextField("Task Name" , text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                Section("Task Date/Time") {
                    DatePicker("Task Date" , selection: $taskToAdd.finishDate , in : daterannge )
                }
                
            }.navigationTitle("updated Task").toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if taskToAdd.name.isEmpty && taskToAdd.description.isEmpty{
                            showAddTaskView = false
                            return
                        }
                        
                        showCancelAlert.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        _ =  taskVM.addTask(task: taskToAdd)
                        showAddTaskView = false
                    } label: {
                        Text("Add")
                    }.disabled(taskToAdd.name.isEmpty)
                    
                }
                
            }.alert("Are you sure you want to go back?", isPresented: $showCancelAlert) {
                Button(role: .destructive) {
                    showAddTaskView = false
                } label: {
                    Text("Yes")
                }
                
            }
            
        }
    }
}

#Preview {
    AddTaskView(showAddTaskView: .constant(false), taskVM: TaskViewModel())
}
