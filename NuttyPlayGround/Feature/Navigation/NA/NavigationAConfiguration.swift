//
//  NavigationAConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class NavigationAConfiguration {
    static let shared: NavigationAConfiguration = NavigationAConfiguration()
    
    func configure(_ viewController: NavigationAViewController) {
        let interactor = NavigationAInteractor()
        let presenter = NavigationAPresenter()
        let router = NavigationARouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
