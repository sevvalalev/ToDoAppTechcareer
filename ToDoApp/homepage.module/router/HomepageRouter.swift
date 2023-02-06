//
//  HomepageRouter.swift
//  ToDoApp
//
//  Created by Sevval Alev on 4.02.2023.
//

import Foundation

class HomepageRouter : PresenterToRouterHomepageProtocol {
    static func createModule(ref: ViewController) {
        let presenter = HomepagePresenter()
        ref.homepagePresenter = presenter
        ref.homepagePresenter?.homepageInteractor = HomepageInteractor()
        ref.homepagePresenter?.homepageView = ref
        ref.homepagePresenter?.homepageInteractor?.homepagePresenter = presenter
    }
}
