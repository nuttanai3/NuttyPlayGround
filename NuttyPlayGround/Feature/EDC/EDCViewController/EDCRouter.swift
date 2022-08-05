//
//  EDCRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class EDCRouter: NSObject, EDCRoutingLogic, EDCDataPassing {
    weak var viewController: EDCViewController?
    var dataStore: EDCDataStore?
}
