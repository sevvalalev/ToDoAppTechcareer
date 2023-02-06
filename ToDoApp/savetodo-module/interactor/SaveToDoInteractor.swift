//
//  SaveToDoInteractor.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class SaveToDoInteractor : PresenterToInteractorSaveToDoProtocol {
    let db:FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func save(todo_title:String,todo_content:String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO todo (todo_title,todo_content) VALUES (?,?)", values: [todo_title,todo_content])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
