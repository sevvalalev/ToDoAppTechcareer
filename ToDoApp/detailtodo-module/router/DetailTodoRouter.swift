//
//  DetailTodoRouter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class DetailTodoRouter : PresenterToRouterDetailToDoProtocol {
    static func createModule(ref:ToDoDetailVC){
        ref.detailToDoPresenter = DetailTodoPresenter()
        ref.detailToDoPresenter?.detailToDoInteractor = DetailTodoInteractor()
    }
}
