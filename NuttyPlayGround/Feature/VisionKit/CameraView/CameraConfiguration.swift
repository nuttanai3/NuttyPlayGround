//
//  CameraConfiguration.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

@available(iOS 16.0, *)
class CameraConfiguration {
    static let shared: CameraConfiguration = CameraConfiguration()
    
    func configure(_ viewController: CameraViewController) {
        let interactor = CameraInteractor()
        let presenter = CameraPresenter()
        let router = CameraRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
