//
//  NavigationMainPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationMainPresenter {
    var viewController: NavigationMainDisplayLogic?
    
    required init(viewController: NavigationMainDisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension NavigationMainPresenter: NavigationMainPresentationLogic {
    
    func presentSomethingOnSuccess(response: NavigationMain.Something.Response) {
        let viewModel = NavigationMain.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
