//
//  DetailToDoProtocols.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

protocol PresenterToInteractorDetailToDoProtocol {
    func update(todo_id:Int,todo_title:String,todo_content:String)
}

protocol ViewToPresenterDetailToDoProtocol {
    var detailToDoInteractor:PresenterToInteractorDetailToDoProtocol? {get set}
    func update(todo_id:Int,todo_title:String,todo_content:String)
}

protocol PresenterToRouterDetailToDoProtocol {
    static func createModule(ref:ToDoDetailVC)
}
