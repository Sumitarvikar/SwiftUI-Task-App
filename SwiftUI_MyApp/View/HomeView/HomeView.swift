//
//  HomeView.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 16/04/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var taskVM : TaskViewModel = TaskViewModel()
    @State  var pickerFilter : [String] = ["active" , "completed"]
    @State var selectedFilter : String =  "active"
    @State var selectedtaskView :Bool = false
    @State var isSelectedtaskToShow :Bool = false
    @State var selectedTasktoShow : Task  =  Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    @State private var refrashTableView : Bool = false
    var body: some View {
        
        NavigationStack {
            Picker("Picker filter", selection: $selectedFilter) {
                ForEach(pickerFilter , id: \.self){text in
                    Text(text)
                }
            }.pickerStyle(.segmented).onChange(of: selectedFilter) {
                taskVM.getTask(isActive: selectedFilter == "active" ? true : false  )
                
            }
            List( taskVM.tasks  , id: \.id ){task in
                VStack(alignment: .leading){
                    Text(task.name).font(.title)
                    HStack{
                        Text(task.description).font(.body).font(.subheadline)
                        Spacer()
                        Text("\(task.finishDate.toSting())").font(.subheadline).lineLimit(2)
                    }
                    
                }.onTapGesture {
                    self.selectedTasktoShow  = task
                    self.isSelectedtaskToShow.toggle()
                }
            }.onAppear{
                taskVM.getTask(isActive: true)
            }.listStyle(.plain).navigationTitle("Home").toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        selectedtaskView = true
                    } label: {
                        Image(systemName: "plus")
                    }}
            }.sheet(isPresented: $selectedtaskView, content: {
                AddTaskView(showAddTaskView: $selectedtaskView, taskVM: taskVM)
            })
            .sheet(isPresented: $isSelectedtaskToShow, content: {
                ShowDetailsView(selectedTask: $selectedTasktoShow , showAddTaskView: $isSelectedtaskToShow, refrashTableView: $refrashTableView, taskVM: taskVM)
                
            }).onChange(of: refrashTableView) { _ , _ in
                taskVM.getTask(isActive: selectedFilter == "active" ? true : false )
            }
        }
    }
}

#Preview {
    HomeView()
}
