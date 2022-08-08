//
//  TaskTestConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class TaskTestConfiguration {
    static let shared: TaskTestConfiguration = TaskTestConfiguration()
    
    func configure(_ viewController: TaskTestViewController) {
        let interactor = TaskTestInteractor()
        let presenter = TaskTestPresenter()
        let router = TaskTestRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
