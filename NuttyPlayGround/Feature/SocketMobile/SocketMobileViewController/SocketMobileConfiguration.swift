//
//  SocketMobileConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SocketMobileConfiguration {
    static let shared: SocketMobileConfiguration = SocketMobileConfiguration()
    
    func configure(_ viewController: SocketMobileViewController) {
        let interactor = SocketMobileInteractor()
        let presenter = SocketMobilePresenter()
        let router = SocketMobileRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
