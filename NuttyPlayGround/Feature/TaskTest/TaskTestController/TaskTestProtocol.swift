//
//  TaskTestProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol TaskTestDisplayLogic {
    func displaySomethingOnSuccess(viewModel: TaskTest.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol TaskTestBusinessLogic {
    func doSomething(request: TaskTest.Something.Request)
}

//MARK: Presenter
protocol TaskTestPresentationLogic {
    func presentSomethingOnSuccess(response: TaskTest.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol TaskTestWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol TaskTestRoutingLogic {

}

//MARK: DataStore
protocol TaskTestDataStore {

}

//MARK: DataPassing
protocol TaskTestDataPassing {
    var dataStore: TaskTestDataStore? { get }
}
