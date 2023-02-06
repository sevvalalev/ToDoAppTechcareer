//
//  HomepageProtocols.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

protocol ViewToPresenterHomepageProtocol {
    var homepageInteractor:PresenterToInteractorHomepageProtocol? {get set}
    var homepageView:PresenterToViewHomepageProtocol? {get set}
    
    func loadToDo()
    func search(searchedWord:String)
    func delete(todo_id:Int)
}

protocol PresenterToInteractorHomepageProtocol {
    var homepagePresenter:InteractorToPresenterHomepageProtocol? {get set}
    
    func loadToDo()
    func search(searchedWord:String)
    func delete(todo_id:Int)
}

protocol InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(todoList:[ToDo])
}
protocol PresenterToViewHomepageProtocol {
    func sendDataToView(todoList:[ToDo])
}
protocol PresenterToRouterHomepageProtocol {
    static func createModule(ref:ViewController)
}
