//
//  NavigationAInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationAInteractor {
    var presenter: NavigationAPresentationLogic?
    var worker: NavigationAWorkerProtocol?

    required init(presenter: NavigationAPresentationLogic? = nil,
                  worker: NavigationAWorkerProtocol? = NavigationAWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension NavigationAInteractor: NavigationADataStore, NavigationABusinessLogic {
    func doSomething(request: NavigationA.Something.Request) {
        worker?.doSomeWork()
        
        let response = NavigationA.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
