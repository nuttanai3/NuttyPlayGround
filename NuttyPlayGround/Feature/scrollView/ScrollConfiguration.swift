//
//  ScrollConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ScrollConfiguration {
    static let shared: ScrollConfiguration = ScrollConfiguration()
    
    func configure(_ viewController: ScrollViewController) {
        let interactor = ScrollInteractor()
        let presenter = ScrollPresenter()
        let router = ScrollRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
