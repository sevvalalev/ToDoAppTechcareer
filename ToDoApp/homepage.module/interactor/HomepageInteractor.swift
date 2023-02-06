//
//  HomepageInteractor.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class HomepageInteractor : PresenterToInteractorHomepageProtocol {
    var homepagePresenter: InteractorToPresenterHomepageProtocol?
    
    let db:FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func loadToDo() {
        var list = [ToDo]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM todo", values: nil)
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))!
                let todo_title = rs.string(forColumn: "todo_title")!
                let todo_content = rs.string(forColumn: "todo_content")!
                let todo = ToDo(todo_id: todo_id, todo_title: todo_title, todo_content: todo_content)
                list.append(todo)
            }
            homepagePresenter?.sendDataToPresenter(todoList: list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func search(searchedWord:String) {
        var list = [ToDo]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM todo WHERE todo_title like ?", values: ["%\(searchedWord)%"])
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))!
                let todo_title = rs.string(forColumn: "todo_title")!
                let todo_content = rs.string(forColumn: "todo_content")!
                let todo = ToDo(todo_id: todo_id, todo_title: todo_title, todo_content: todo_content)
                list.append(todo)
            }
            homepagePresenter?.sendDataToPresenter(todoList: list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func delete(todo_id:Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM todo WHERE todo_id = ?", values: [todo_id])
            loadToDo()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
