//
//  PageListRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PageListRouter: NSObject, PageListRoutingLogic, PageListDataPassing {
    weak var viewController: PageListViewController?
    var dataStore: PageListDataStore?
}
