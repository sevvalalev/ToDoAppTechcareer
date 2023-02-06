//
//  SaveToDoProtocols.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

protocol ViewToPresenterSaveToDoProtocol {
    var saveToDoInteractor:PresenterToInteractorSaveToDoProtocol? {get set}
    func save(todo_title:String,todo_content:String)
}

protocol PresenterToInteractorSaveToDoProtocol {
    func save(todo_title:String,todo_content:String)
}

protocol PresenterToRouterSaveToDoProtocol {
    static func createModule(ref:ToDoSaveVC)
}
