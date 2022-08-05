//
//  NavigationMainInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationMainInteractor {
    var presenter: NavigationMainPresentationLogic?
    var worker: NavigationMainWorkerProtocol?

    required init(presenter: NavigationMainPresentationLogic? = nil,
                  worker: NavigationMainWorkerProtocol? = NavigationMainWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension NavigationMainInteractor: NavigationMainDataStore, NavigationMainBusinessLogic {
    func doSomething(request: NavigationMain.Something.Request) {
        worker?.doSomeWork()
        
        let response = NavigationMain.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
