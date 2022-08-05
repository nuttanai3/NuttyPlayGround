//
//  PageListConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PageListConfiguration {
    static let shared: PageListConfiguration = PageListConfiguration()
    
    func configure(_ viewController: PageListViewController) {
        let interactor = PageListInteractor()
        let presenter = PageListPresenter()
        let router = PageListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
