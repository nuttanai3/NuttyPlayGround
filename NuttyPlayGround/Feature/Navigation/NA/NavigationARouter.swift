//
//  NavigationARouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationARouter: NSObject, NavigationARoutingLogic, NavigationADataPassing {
    weak var viewController: NavigationAViewController?
    var dataStore: NavigationADataStore?
}
