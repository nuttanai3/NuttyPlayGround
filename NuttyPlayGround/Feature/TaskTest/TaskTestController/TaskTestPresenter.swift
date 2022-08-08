//
//  TaskTestPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TaskTestPresenter {
    var viewController: TaskTestDisplayLogic?
    
    required init(viewController: TaskTestDisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension TaskTestPresenter: TaskTestPresentationLogic {
    
    func presentSomethingOnSuccess(response: TaskTest.Something.Response) {
        let viewModel = TaskTest.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
