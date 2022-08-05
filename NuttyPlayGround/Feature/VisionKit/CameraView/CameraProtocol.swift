//
//  CameraProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol CameraDisplayLogic {
    func displaySomethingOnSuccess(viewModel: Camera.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol CameraBusinessLogic {
    func doSomething(request: Camera.Something.Request)
}

//MARK: Presenter
protocol CameraPresentationLogic {
    func presentSomethingOnSuccess(response: Camera.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol CameraWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol CameraRoutingLogic {

}

//MARK: DataStore
protocol CameraDataStore {

}

//MARK: DataPassing
protocol CameraDataPassing {
    var dataStore: CameraDataStore? { get }
}
