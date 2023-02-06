//
//  DetailTodoPresenter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class DetailTodoPresenter : ViewToPresenterDetailToDoProtocol{
    var detailToDoInteractor: PresenterToInteractorDetailToDoProtocol?
    func update(todo_id: Int, todo_title: String, todo_content: String) {
        detailToDoInteractor?.update(todo_id: todo_id, todo_title: todo_title, todo_content: todo_content)
    }
}
