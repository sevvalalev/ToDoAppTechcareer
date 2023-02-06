//
//  SaveToDoRouter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class SaveToDoRouter : PresenterToRouterSaveToDoProtocol {
    static func createModule(ref:ToDoSaveVC) {
        ref.saveToDoPresenter = SaveToDoPresenter()
        ref.saveToDoPresenter?.saveToDoInteractor = SaveToDoInteractor()
    }
}
