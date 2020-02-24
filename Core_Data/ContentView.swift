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
    @FetchRequest(fetchRequest: ToDoItem.getALlToDoItems()) var TodoItems: FetchedResults<ToDoItem>
    
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
                            toDoItem.title = self.newToDoItem
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                    
                }.font(.headline)
                
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
