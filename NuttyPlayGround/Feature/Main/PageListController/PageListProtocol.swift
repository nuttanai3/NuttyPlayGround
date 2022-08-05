//
//  PageListProtocol.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol PageListDisplayLogic: class {
    func displaySomething(viewModel: PageList.Something.ViewModel)
}

//MARK: Interactor
protocol PageListBusinessLogic {
    func doSomething(request: PageList.Something.Request)
}

//MARK: Presenter
protocol PageListPresentationLogic {
    func presentSomething(response: PageList.Something.Response)
}

//MARK: Routable
@objc protocol PageListRoutingLogic {

}

//MARK: DataStore
protocol PageListDataStore {

}

//MARK: DataPassing
protocol PageListDataPassing {
    var dataStore: PageListDataStore? { get }
}
