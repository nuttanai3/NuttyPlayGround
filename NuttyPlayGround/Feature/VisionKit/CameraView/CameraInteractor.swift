//
//  CameraInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CameraInteractor {
    var presenter: CameraPresentationLogic?
    var worker: CameraWorkerProtocol?

    required init(presenter: CameraPresentationLogic? = nil,
                  worker: CameraWorkerProtocol? = CameraWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension CameraInteractor: CameraDataStore, CameraBusinessLogic {
    func doSomething(request: Camera.Something.Request) {
        worker?.doSomeWork()
        
        let response = Camera.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
