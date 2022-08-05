//
//  ScrollPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ScrollPresenter {
    var viewController: ScrollDisplayLogic?
    
    required init(viewController: ScrollDisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension ScrollPresenter: ScrollPresentationLogic {
    
    func presentSomethingOnSuccess(response: Scroll.Something.Response) {
        let viewModel = Scroll.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
