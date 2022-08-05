//
//  PageListInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PageListInteractor {
    var presenter: PageListPresentationLogic?
    var worker: PageListWorker?

    required init() {
        worker = PageListWorker()
    }
}

extension PageListInteractor: PageListDataStore, PageListBusinessLogic {
    func doSomething(request: PageList.Something.Request) {
        worker?.doSomeWork()
        
        let response = PageList.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
