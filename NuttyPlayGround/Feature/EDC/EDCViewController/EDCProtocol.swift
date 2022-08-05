//
//  EDCProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol EDCDisplayLogic: class {
    func displaySomething(viewModel: EDC.Something.ViewModel)
}

//MARK: Interactor
protocol EDCBusinessLogic {
    func doSomething(request: EDC.Something.Request)
}

//MARK: Presenter
protocol EDCPresentationLogic {
    func presentSomething(response: EDC.Something.Response)
}

//MARK: Routable
@objc protocol EDCRoutingLogic {

}

//MARK: DataStore
protocol EDCDataStore {

}

//MARK: DataPassing
protocol EDCDataPassing {
    var dataStore: EDCDataStore? { get }
}
