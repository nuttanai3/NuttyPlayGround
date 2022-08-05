//
//  EDCPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class EDCPresenter {
    weak var viewController: EDCDisplayLogic?
    
    required init() {
        
    }
}

extension EDCPresenter: EDCPresentationLogic {
    
    func presentSomething(response: EDC.Something.Response) {
        let viewModel = EDC.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
