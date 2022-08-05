//
//  SocketMobilePresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SocketMobilePresenter {
    weak var viewController: SocketMobileDisplayLogic?
    
    required init() {
        
    }
}

extension SocketMobilePresenter: SocketMobilePresentationLogic {
    
    func presentSomething(response: SocketMobile.Something.Response) {
        let viewModel = SocketMobile.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
