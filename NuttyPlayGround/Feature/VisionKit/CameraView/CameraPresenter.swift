//
//  CameraPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CameraPresenter {
    var viewController: CameraDisplayLogic?
    
    required init(viewController: CameraDisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension CameraPresenter: CameraPresentationLogic {
    
    func presentSomethingOnSuccess(response: Camera.Something.Response) {
        let viewModel = Camera.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
