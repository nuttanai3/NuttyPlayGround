//
//  NavigationMainRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationMainRouter: NSObject, NavigationMainRoutingLogic, NavigationMainDataPassing {
    weak var viewController: NavigationMainViewController?
    var dataStore: NavigationMainDataStore?
}
