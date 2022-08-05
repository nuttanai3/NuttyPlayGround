//
//  EDCConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class EDCConfiguration {
    static let shared: EDCConfiguration = EDCConfiguration()
    
    func configure(_ viewController: EDCViewController) {
        let interactor = EDCInteractor()
        let presenter = EDCPresenter()
        let router = EDCRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
