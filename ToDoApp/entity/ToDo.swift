//
//  ToDo.swift
//  ToDoApp
//
//  Created by Sevval Alev on 3.02.2023.
//

import Foundation

class ToDo {
    var todo_id:Int?
    var todo_title:String?
    var todo_content:String?
    
    init(todo_id: Int, todo_title: String, todo_content: String) {
        self.todo_id = todo_id
        self.todo_title = todo_title
        self.todo_content = todo_content
    }
}
