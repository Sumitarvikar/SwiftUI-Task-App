//
//  ShowDetailsView.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 19/04/24.
//

import SwiftUI

struct ShowDetailsView: View {
    
    @Binding  var selectedTask: Task
    @Binding  var showAddTaskView :  Bool
    @Binding  var refrashTableView : Bool
    @ObservedObject var taskVM : TaskViewModel
    @State private var taskDeleteAlert : Bool = false
    @State private var taskUpdateAlert : Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task Details")) {
                    TextField("Task Name" , text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description)
                    Toggle("Mark Completed", isOn: $selectedTask.isCompleted)
                }
                Section("Task Date/Time") {
                    DatePicker("Task Date" , selection: $selectedTask.finishDate)
                }
                Section(){
                    Button {
                        taskDeleteAlert.toggle()
                    } label: {
                        Text("Delete").frame(alignment: .center)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity , alignment: .center)
                    }
                    
                }
                
            }.navigationTitle("Task Details").toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showAddTaskView.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(role: .destructive){
                        taskUpdateAlert.toggle()
                    } label: {
                        Text("Update")
                    }.disabled(selectedTask.name.isEmpty)
                }
                
                
            }.alert("Are you sure you want to delete this task? This action cannot be undone.", isPresented: $taskDeleteAlert) {
                Button {
                    _ = taskVM.deleteTask(task: selectedTask)
                    refrashTableView.toggle()
                    showAddTaskView.toggle()
                } label: {
                    Text("Delete")
                }
            }
            .alert("Are you sure you want to update this task?", isPresented: $taskUpdateAlert) {
                Button {
                    _ =  taskVM.updateTask(task: selectedTask)
                    refrashTableView.toggle()
                    showAddTaskView.toggle()
                } label: {
                    Text("Update")
                }
                Button {
                    
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
}

#Preview {
    ShowDetailsView(selectedTask:.constant(Task(id: 0, name: "test", description: "test", isCompleted: false, finishDate: Date())), showAddTaskView: .constant(true), refrashTableView: .constant(false), taskVM: TaskViewModel())
}
