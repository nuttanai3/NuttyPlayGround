//
//  TaskTestInteractor.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TaskTestInteractor {
    var presenter: TaskTestPresentationLogic?
    var worker: TaskTestWorkerProtocol?

    required init(presenter: TaskTestPresentationLogic? = nil,
                  worker: TaskTestWorkerProtocol? = TaskTestWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension TaskTestInteractor: TaskTestDataStore, TaskTestBusinessLogic {
    func doSomething(request: TaskTest.Something.Request) {
        worker?.doSomeWork()
        
        let response = TaskTest.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
