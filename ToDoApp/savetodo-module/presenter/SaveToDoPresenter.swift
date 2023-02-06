//
//  SaveToDoPresenter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class SaveToDoPresenter : ViewToPresenterSaveToDoProtocol {
    var saveToDoInteractor: PresenterToInteractorSaveToDoProtocol?
    func save(todo_title: String, todo_content: String) {
        saveToDoInteractor?.save(todo_title: todo_title, todo_content: todo_content)
    }
}
