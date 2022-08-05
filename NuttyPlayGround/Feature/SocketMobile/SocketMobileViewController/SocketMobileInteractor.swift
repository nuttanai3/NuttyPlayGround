//
//  SocketMobileInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SocketMobileInteractor {
    var presenter: SocketMobilePresentationLogic?
    var worker: SocketMobileWorker?

    required init() {
        worker = SocketMobileWorker()
    }
}

extension SocketMobileInteractor: SocketMobileDataStore, SocketMobileBusinessLogic {
    func doSomething(request: SocketMobile.Something.Request) {
        worker?.doSomeWork()
        
        let response = SocketMobile.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
