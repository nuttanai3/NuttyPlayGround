//
//  EDCInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class EDCInteractor {
    var presenter: EDCPresentationLogic?
    var worker: EDCWorker?

    required init() {
        worker = EDCWorker()
    }
}

extension EDCInteractor: EDCDataStore, EDCBusinessLogic {
    func doSomething(request: EDC.Something.Request) {
        worker?.doSomeWork()
        
        let response = EDC.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
