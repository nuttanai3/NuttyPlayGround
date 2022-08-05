//
//  ScrollRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ScrollRouter: NSObject, ScrollRoutingLogic, ScrollDataPassing {
    weak var viewController: ScrollViewController?
    var dataStore: ScrollDataStore?
}
