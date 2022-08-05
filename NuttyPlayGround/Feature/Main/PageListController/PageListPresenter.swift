//
//  PageListPresenter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PageListPresenter {
    weak var viewController: PageListDisplayLogic?
    
    required init() {
        
    }
}

extension PageListPresenter: PageListPresentationLogic {
    
    func presentSomething(response: PageList.Something.Response) {
        let viewModel = PageList.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
