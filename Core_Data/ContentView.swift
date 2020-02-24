//
//  ContentView.swift
//  Core_Data
//
//  Created by Vasileios Gkreen on 24/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    // access the extended function in our model class
    @FetchRequest(fetchRequest: ToDoItem.getALlToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    
    // for our textFiled input
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            
            List {
                
                Section(header: Text("What's Next?")) {
                    HStack{
                        TextField("new Item", text: $newToDoItem)
                        Button(action: {
                            
                            // access the todo item object from the context
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            // pass as title the value of our input
                            toDoItem.title = self.newToDoItem
                            // add date
                            toDoItem.createdAt = Date()
                            
                            // save the updated version of our managed object
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            
                            // after adding to core data cleanup input
                            self.newToDoItem = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                    
                }.font(.headline)
                
                Section(header: Text("To Do's")){
                    // get all the fetchResults of todos
                    ForEach(self.toDoItems) { item in
                        ToDoItemRow(title: item.title, createdAt: "\(item.createdAt!)")
                    }.onDelete {indexSet in
                        // get an item on the list by its index
                        // and pass it on the delete method of the manageObjectContext
                        // to delete it
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        // after deleteing the item we need to save
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
                
            }
            .navigationBarTitle("My List")
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
