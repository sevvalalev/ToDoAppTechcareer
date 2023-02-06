//
//  HomepagePresenter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class HomepagePresenter : ViewToPresenterHomepageProtocol {
    
    var homepageInteractor: PresenterToInteractorHomepageProtocol?
    var homepageView: PresenterToViewHomepageProtocol?
    
    func loadToDo() {
        homepageInteractor?.loadToDo()
    }
    func search(searchedWord: String) {
        homepageInteractor?.search(searchedWord: searchedWord)
    }
    func delete(todo_id:Int) {
        homepageInteractor?.delete(todo_id:todo_id)
    }
}

extension HomepagePresenter : InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(todoList: [ToDo]) {
        homepageView?.sendDataToView(todoList: todoList)
    }
}
