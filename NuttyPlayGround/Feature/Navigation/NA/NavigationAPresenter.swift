//
//  NavigationAPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationAPresenter {
    var viewController: NavigationADisplayLogic?
    
    required init(viewController: NavigationADisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension NavigationAPresenter: NavigationAPresentationLogic {
    
    func presentSomethingOnSuccess(response: NavigationA.Something.Response) {
        let viewModel = NavigationA.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
