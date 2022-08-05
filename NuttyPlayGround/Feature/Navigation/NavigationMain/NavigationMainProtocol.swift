//
//  NavigationMainProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol NavigationMainDisplayLogic {
    func displaySomethingOnSuccess(viewModel: NavigationMain.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol NavigationMainBusinessLogic {
    func doSomething(request: NavigationMain.Something.Request)
}

//MARK: Presenter
protocol NavigationMainPresentationLogic {
    func presentSomethingOnSuccess(response: NavigationMain.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol NavigationMainWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol NavigationMainRoutingLogic {

}

//MARK: DataStore
protocol NavigationMainDataStore {

}

//MARK: DataPassing
protocol NavigationMainDataPassing {
    var dataStore: NavigationMainDataStore? { get }
}
