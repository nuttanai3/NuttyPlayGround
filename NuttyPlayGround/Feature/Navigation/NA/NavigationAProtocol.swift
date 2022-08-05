//
//  NavigationAProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol NavigationADisplayLogic {
    func displaySomethingOnSuccess(viewModel: NavigationA.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol NavigationABusinessLogic {
    func doSomething(request: NavigationA.Something.Request)
}

//MARK: Presenter
protocol NavigationAPresentationLogic {
    func presentSomethingOnSuccess(response: NavigationA.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol NavigationAWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol NavigationARoutingLogic {

}

//MARK: DataStore
protocol NavigationADataStore {

}

//MARK: DataPassing
protocol NavigationADataPassing {
    var dataStore: NavigationADataStore? { get }
}
