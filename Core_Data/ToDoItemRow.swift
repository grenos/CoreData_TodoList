//
//  ToDoItemRow.swift
//  Core_Data
//
//  Created by Vasileios Gkreen on 24/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ToDoItemRow: View {
    var title: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct ToDoItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemRow(title: "TEST", createdAt: "TEST")
    }
}
