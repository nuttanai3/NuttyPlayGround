//
//  ScrollProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol ScrollDisplayLogic {
    func displaySomethingOnSuccess(viewModel: Scroll.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol ScrollBusinessLogic {
    func doSomething(request: Scroll.Something.Request)
}

//MARK: Presenter
protocol ScrollPresentationLogic {
    func presentSomethingOnSuccess(response: Scroll.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol ScrollWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol ScrollRoutingLogic {

}

//MARK: DataStore
protocol ScrollDataStore {

}

//MARK: DataPassing
protocol ScrollDataPassing {
    var dataStore: ScrollDataStore? { get }
}
