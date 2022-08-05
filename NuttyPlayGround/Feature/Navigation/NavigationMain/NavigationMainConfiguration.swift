//
//  NavigationMainConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class NavigationMainConfiguration {
    static let shared: NavigationMainConfiguration = NavigationMainConfiguration()
    
    func configure(_ viewController: NavigationMainViewController) {
        let interactor = NavigationMainInteractor()
        let presenter = NavigationMainPresenter()
        let router = NavigationMainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
