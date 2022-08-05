//
//  SocketMobileProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol SocketMobileDisplayLogic: class {
    func displaySomething(viewModel: SocketMobile.Something.ViewModel)
}

//MARK: Interactor
protocol SocketMobileBusinessLogic {
    func doSomething(request: SocketMobile.Something.Request)
}

//MARK: Presenter
protocol SocketMobilePresentationLogic {
    func presentSomething(response: SocketMobile.Something.Response)
}

//MARK: Routable
@objc protocol SocketMobileRoutingLogic {

}

//MARK: DataStore
protocol SocketMobileDataStore {

}

//MARK: DataPassing
protocol SocketMobileDataPassing {
    var dataStore: SocketMobileDataStore? { get }
}
