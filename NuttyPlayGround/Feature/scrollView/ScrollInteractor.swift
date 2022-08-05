//
//  ScrollInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ScrollInteractor {
    var presenter: ScrollPresentationLogic?
    var worker: ScrollWorkerProtocol?

    required init(presenter: ScrollPresentationLogic? = nil,
                  worker: ScrollWorkerProtocol? = ScrollWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension ScrollInteractor: ScrollDataStore, ScrollBusinessLogic {
    func doSomething(request: Scroll.Something.Request) {
        worker?.doSomeWork()
        
        let response = Scroll.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
