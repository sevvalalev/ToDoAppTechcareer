//
//  DetailTodoInteractor.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class DetailTodoInteractor : PresenterToInteractorDetailToDoProtocol {
    let db:FMDatabase?
        
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func update(todo_id: Int, todo_title: String, todo_content: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE todo SET todo_title = ? , todo_content = ? WHERE todo_id = ?", values: [todo_title,todo_content,todo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
